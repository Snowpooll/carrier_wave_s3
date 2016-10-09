CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

CarrierWave.configure do |config|

  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => Rails.application.secrets.aws_access_key_id,
      :aws_secret_access_key  => Rails.application.secrets.aws_secret_access_key,
      :region                 => 'ap-northeast-1',
      :path_style             => true,
  }

  config.fog_public = true
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

  config.fog_directory = 'carrier-wave-s3' if Rails.env.production?
  config.fog_directory = 'carrier-wave-s3' if Rails.env.development?


end
