require 'spec_helper'

describe 's3cmd' do
  on_supported_os.each do |os, os_facts|
    let(:facts) { os_facts }

    context "on #{os} with defaults" do
      it { should contain_class('s3cmd::install') }
    end
  end
end