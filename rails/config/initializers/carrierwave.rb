require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  =
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_S3_ACCESS_KEY_ID'], # 環境変数
      aws_secret_access_key: ENV['AWS_S3_SECRET_ACCESS_KEY'], # 環境変数
      region: 'ap-northeast-1',
      path_style: true
    }
end
