require 'spec_helper'

describe Travis::Client::Account do
  context "from all accounts" do
    let(:session) { Travis::Client.new }
    subject { session.accounts.first }
    rspec-its(:name) { should be == 'Konstantin Haase' }
    rspec-its(:login) { should be == 'rkh' }
    rspec-its(:type) { should be == 'user' }
    rspec-its(:repos_count) { should be == 200 }
    rspec-its(:inspect) { should be == "#<Travis::Client::Account: rkh>" }
  end

  context "known account" do
    let(:session) { Travis::Client.new }
    subject { session.account('rkh') }
    rspec-its(:name) { should be == 'Konstantin Haase' }
    rspec-its(:login) { should be == 'rkh' }
    rspec-its(:type) { should be == 'user' }
    rspec-its(:repos_count) { should be == 200 }
    rspec-its(:inspect) { should be == "#<Travis::Client::Account: rkh>" }
  end

  context "known account" do
    let(:session) { Travis::Client.new }
    subject { session.account('foo') }
    rspec-its(:name) { should be_nil }
    rspec-its(:login) { should be == 'foo' }
    rspec-its(:type) { should be_nil }
    rspec-its(:inspect) { should be == "#<Travis::Client::Account: foo>" }
  end
end
