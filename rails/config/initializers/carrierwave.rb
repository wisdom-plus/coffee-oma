require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage :fog
  config.fog_directory = 'coffee-oma-image-bucket'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV.fetch('AWS_S3_ACCESS_KEY_ID', nil),
    aws_secret_access_key: ENV.fetch('AWS_S3_SECRET_ACCESS_KEY', nil),
    region: 'ap-northeast-1',
    path_style: true
  }
end
