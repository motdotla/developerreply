require 'spec_helper'

describe Developerreply do
  subject { Developerreply }

  describe "defaults" do
    before do
      subject.username = nil
      subject.password = nil
    end

    it { expect(subject::VERSION).to eq("0.0.1") }
  end

  describe "setting values" do
    let(:username)   { "username" }
    let(:password)   { "password" }

    before do
      subject.username = username
      subject.password = password
    end

    it { expect(subject.username).to eq(username) }
    it { expect(subject.password).to eq(password) }
  end
end
