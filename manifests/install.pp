class s3cmd::install inherits s3cmd::params {
  include wget

  Exec {
    path => '/usr/bin:/bin:/usr/sbin:/sbin'
  }

  $version_number = regsubst($s3cmd::params::version, '^v', '')# "$s3cmd::params::version"[1,0]
  $filename = "s3cmd-${version_number}.tar.gz"
  $url = "https://github.com/s3tools/s3cmd/releases/download/${s3cmd::params::version}/${filename}"
  $temp_file_name = 's3cmd.tar.gz'
  $temp_file = "${s3cmd::params::temp_dir}/${temp_file_name}"

  wget::fetch { $url:
    destination => $temp_file,
  }

  exec { 'unzip_s3cmd':
    command     => "tar -zxf ${temp_file}",
    cwd         => $s3cmd::params::temp_dir,
    creates     => "${s3cmd::params::install_dir}/s3cmd",
    subscribe   => Wget::Fetch[$url],
    refreshonly => true,
  }

  exec { 'deploy_s3cmd':
    command     => "mv ${temp_dir}/s3cmd-${version_number}/S3 ${temp_dir}/s3cmd-${version_number}/s3cmd ${s3cmd::params::install_dir}",
    subscribe   => Exec['unzip_s3cmd'],
    refreshonly => true,
  }

  file { "${s3cmd::params::install_bin}/s3cmd":
    ensure    => 'link',
    target    => "${s3cmd::params::install_dir}/s3cmd",
    subscribe => Exec['deploy_s3cmd'],
  }
}
