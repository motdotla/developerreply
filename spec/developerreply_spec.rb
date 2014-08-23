require 'spec_helper'

describe Developerreply do
  subject { Developerreply }

  describe "defaults" do
    before do
      subject.username = nil
      subject.password = nil
    end

    it { subject::VERSION.should eq "0.0.1" }
  end

  describe "setting values" do
    let(:username)   { "username" }
    let(:password)   { "password" }

    before do
      subject.username = username
      subject.password = password
    end

    it { subject.username.should eq username }
    it { subject.password.should eq password }
  end
end
