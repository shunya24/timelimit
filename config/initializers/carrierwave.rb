require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage :fog
  config.fog_provider = 'fog/aws'
  
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY'],
    aws_secret_access_key: ENV['AWS_SECRET_KEY'],
    region: ENV['AWS_DEFAULT_REGION'],
    path_style: true
  }
  config.fog_public = false
  config.fog_directory  = 'time-limit'
  config.asset_host = 'https://time-limit.s3.amazonaws.com'
  config.cache_storage = :fog
end