Recaptcha.configure do |config|
  config.site_key = ENV.fetch('RECAPTCHA_PUBLIC_KEY', nil)
  config.secret_key = ENV.fetch('RECAPTCHA_PRIVATE_KEY', nil)
end
