require 'bundler'
Bundler::GemHelper.install_tasks

# Check if versions are correct between VERSION constants and .js files
#
task :release => [:guard_version]

task :guard_version do
  def check_version(file, pattern, constant)
    body = File.read("vendor/assets/javascripts/#{file}")
    match = body.match(pattern) or abort "Version check failed: no pattern matched in #{file}"
    file_version = body.match(pattern)[1]
    constant_version = Mootools::Rails.const_get(constant)

    unless constant_version == file_version
      abort "Mootools::Rails::#{constant} was #{constant_version} but it should be #{file_version}"
    end
  end

  check_version('mootools.js', /version: '([\S]+)'/, 'MOOTOOLS_VERSION')
end
