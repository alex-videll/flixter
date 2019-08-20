CarrierWave.configure do |config|
  config.directory_permissions = 0777
  	config.permissions = 0666
  config.fog_provider = 'fog/aws'
  config.fog_directory  = ENV["AWS_BUCKET"]                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV["AWS_ACCESS_KEY"],        # required
    aws_secret_access_key: ENV["AWS_SECRET_KEY"],        # required
  }
  config.fog_directory  = ENV["AWS_BUCKET"]              # required
end