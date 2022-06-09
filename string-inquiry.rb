module Accidental
  # Adds methods to strings which allows checking for string equality through
  # arbitrary predicate methods;
  #
  # @example
  #   runtime_mode = "deploy".freeze
  #   runtime_mode = Accidental::StringInquiry.upgrade runtime_mode
  #
  #   # predicate methods check for string equality
  #   runtime_mode.deploy?      #=> true
  #   runtime_mode.development? #=> false
  #
  #   # still a string, we add methods to the singleton class
  #   runtime_mode.class        #=> String
  #   runtime_mode == "deploy"  #=> true
  module StringInquiry

    # matches predicate looking methods
    INQUIRER_FORMAT = /^(.+)\?$/

    # a duplicate of the given string, with StringInquiry functionality mixed in.
    # @return [String]
    def self.upgrade(str)
      raise ArgumentError, "must be a string!" unless str.is_a? String

      str.dup.tap { _1.singleton_class.include StringInquiry }
    end

    # @param name [String] the method name to turn into a predicate check
    # @return [String, nil] the string to check, or nil if not a predicate
    def predicate_value(name)
      match = INQUIRER_FORMAT.match name
      match&.[](1)
    end

    # If the name of the missing method is a predicate (per {INQUIRER_FORMAT}),
    # the return value will be the string equality of the method name with self.
    #
    # If the missing method is _not_ a predicate, keep going up the chain.
    #
    # @example
    #   foo = StringInquiry.upgrade "foo"
    #   "foo".development  #=> NoMethodError
    #   "foo".development? #=> false ("foo" != "development")
    #   "foo".foo?         #=> true ("foo" == "foo")
    def method_missing(name, ...)
      value = predicate_value(name.to_s)
      return super(name, ...) if value.nil?

      eql? value
    end

    def respond_to_missing?(name, incl_private = false)
      predicate_value(name.to_s) ? super : true
    end

  end
end

