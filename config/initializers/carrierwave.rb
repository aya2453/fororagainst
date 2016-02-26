CarrierWave.configure do |config|
    config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
    region: 'us-east-1'
  }

    case Rails.env
    when 'development'
        config.fog_directory  = 'fororagainst'
        config.asset_host = 'https://s3.amazonaws.com/for-or-against'
    when 'production'
        config.fog_directory  = 'fororaginst'
        config.asset_host = 'https://s3.amazonaws.com/for-or-against'
    end
end