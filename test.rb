require 'minitest/autorun'
require './accidental/string-inquirer'

describe Accidental::StringInquirer do
  before do
    @mode = "development"
    @mode = Accidental::StringInquirer.upgrade(@mode)
  end

  it "should still be a string" do 
    assert_kind_of String, @mode
  end

  it "should respond to arbitrary predicates" do
    assert_respond_to @mode, :whatever?
  end

  it "true when predicate matches the string" do
    assert @mode.development?
  end

  it "false when predicate doesn't match the string" do
    refute @mode.whatever?
  end

  it "can hand out a method" do
    meth = @mode.method(:development?)

    assert_kind_of Method, meth
    assert meth.call
  end
end

