Rails.application.configure do
  config.lograge.base_controller_class = ['ActionController::API', 'ActionController::Base']

  config.lograge.custom_options = lambda do |event|
    {time: Time.now}
  end
end
