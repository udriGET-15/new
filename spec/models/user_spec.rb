require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "123456", password_confirmation: "123456")
  end

  subject { @user }
  
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
end