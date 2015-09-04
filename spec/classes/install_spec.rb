require 'spec_helper'

describe 's3cmd::install' do
  it { should contain_exec('unzip_s3cmd').with(
    command: 'tar -zxf /tmp/s3cmd.tar.gz',
    cwd: '/tmp',
    creates: '/usr/local/share/s3cmd'
  ) }
end
