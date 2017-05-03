CarrierWave.configure do |config|
    config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
        aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
        region: 'ap-northeast-2',
        endpoint: 'http://s3.ap-northeast-2.amazonaws.com'
    }
    config.fog_directory = '/sojoong2talk'
    config.fog_public = true
    config.fog_attributes = {} # optional, defaults to {}
end