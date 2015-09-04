# s3cmd
#
# Parameters:
#
#   [*install_bin] - path to link the s3cmd to
#   [*install_dir] - path to install s3cmd in. It results to ${install_dir}/s3cmd
#   [*temp_dir]    - temp path used at installation
#   [*version]     - s3cmd release
#
# Usage:
#
#   include s3cmd
#
class s3cmd (
  $install_bin = $s3cmd::params::install_bin,
  $install_dir = $s3cmd::params::install_dir,
  $temp_dir    = $s3cmd::params::temp_dir,
  $version     = $s3cmd::params::version,
) inherits s3cmd::params {

  validate_absolute_path($install_dir)
  validate_string($version)

  include s3cmd::install
}
