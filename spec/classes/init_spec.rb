require 'spec_helper'

describe 's3cmd' do
  context 'with defaults' do
    it { should contain_class('s3cmd::install') }
  end
end
