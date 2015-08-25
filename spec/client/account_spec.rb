require 'spec_helper'

describe Travis::Client::Account do
  context "from all accounts" do
    let(:session) { Travis::Client.new }
    subject { session.accounts.first }
    rpsec-its(:name) { should be == 'Konstantin Haase' }
    rpsec-its(:login) { should be == 'rkh' }
    rpsec-its(:type) { should be == 'user' }
    rpsec-its(:repos_count) { should be == 200 }
    rpsec-its(:inspect) { should be == "#<Travis::Client::Account: rkh>" }
  end

  context "known account" do
    let(:session) { Travis::Client.new }
    subject { session.account('rkh') }
    rpsec-its(:name) { should be == 'Konstantin Haase' }
    rpsec-its(:login) { should be == 'rkh' }
    rpsec-its(:type) { should be == 'user' }
    rpsec-its(:repos_count) { should be == 200 }
    rpsec-its(:inspect) { should be == "#<Travis::Client::Account: rkh>" }
  end

  context "known account" do
    let(:session) { Travis::Client.new }
    subject { session.account('foo') }
    rpsec-its(:name) { should be_nil }
    rpsec-its(:login) { should be == 'foo' }
    rpsec-its(:type) { should be_nil }
    rpsec-its(:inspect) { should be == "#<Travis::Client::Account: foo>" }
  end
end
