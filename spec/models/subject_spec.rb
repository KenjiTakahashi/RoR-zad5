require 'spec_helper'

describe Subject do
  it "should not allow empty name" do
    Subject.new.should have(1).errors_on(:name)
  end
  it "should allow non-empty name" do
    Subject.new(:name => "Clockwork Orange").should have(0).errors_on(:name)
  end
end
