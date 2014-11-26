require 'rails_helper'

describe User do 

	before { @user = build(:user) }

  subject { @user }

  it { should be_valid }

  it { should respond_to(:email) }
  it { should respond_to(:username) }
  it { should respond_to(:password) }

  # START OF USERNAME TESTING 

  describe "when the username is not present" do
    before { @user.username = nil }
    it { should_not be_valid }
  end

  describe "when the username is too long" do
  	before { @user.username = "ba" * 500 }
  	it { should_not be_valid }
  end

	describe "when the username is too short" do
  	before { @user.username = "d" }
  	it { should_not be_valid }
  end

  # END OF USERNAME TESTING


  # START OF EMAIL TESTING 

  describe "when the email is not present" do
    before { @user.email = nil }
    it { should_not be_valid }
  end

  describe "when the email is not valid" do
  	before { @user.email = "foobar" }
  	it { should_not be_valid }
  end  

  # END OF EMAIL TESTING

  # START OF PASSWORD TESTING 

  describe "when the password is too long" do
  	before { @user.password = "ba" * 500 }
  	it { should_not be_valid }
  end

	describe "when the password is too short" do
  	before { @user.password = "d" }
  	it { should_not be_valid }
  end

  # END OF PASSWORD TESTING 




end