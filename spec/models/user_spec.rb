require 'spec_helper'

describe User do
  before(:each) do
    @user = User.create!(email: "foo@example.com")
  end

  subject { @user }

  it { should respond_to(:email) }
  it { should be_valid }

  describe "validations" do
    it "should require an email" do
      @user.email = " "
      @user.should_not be_valid
    end

    it "should accept valid emails" do
      emails = %w[FOO@EXAMPLE.COM foo+bar@example.com foo.bar@baz.example.com]
      emails.each do |valid|
        @user.email = valid
        @user.should be_valid
      end
    end

    it "should deny invalid emails" do
      emails = %w[foo@example,com foo_at_example.com foo@example]
      emails.each do |invalid|
        @user.email = invalid
        @user.should_not be_valid
      end
    end

    it "should deny duplicate emails" do
      same_email_user = @user.dup
      same_email_user.email = same_email_user.email.upcase
      same_email_user.should_not be_valid
    end
  end
end
