require 'spec_helper'

describe Developerreply do
  subject { Developerreply }

  describe "defaults" do
    before do
      subject.username = nil
      subject.password = nil
    end

    it { expect(subject::VERSION).to eq("0.0.2") }
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

  describe ".create" do
    let(:username) { ENV["SENDGRID_USERNAME"] }
    let(:password) { ENV["SENDGRID_PASSWORD"] }

    let(:hostname)  { "#{Time.now.to_i}.webhook.email" }
    let(:url)       { "http://domain-#{Time.now.to_i}.com/inbound" }

    before do
      subject.username = username
      subject.password = password
    end

    it do
      resp = subject.create({hostname: hostname, url: url})
      expect(resp).to eq(true)
    end
  end
end
