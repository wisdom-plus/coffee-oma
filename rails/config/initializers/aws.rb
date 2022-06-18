creds = Aws::Credentials.new(
  ENV.fetch('AWS_SES_ACCESS_KEY_ID', nil),
  ENV.fetch('AWS_SES_SECRET_ACCESS_KEY', nil)
)
Aws::Rails.add_action_mailer_delivery_method(
  :ses,
  credentials: creds,
  region: 'ap-northeast-1'
)
