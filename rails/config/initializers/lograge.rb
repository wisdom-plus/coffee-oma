Rails.application.configure do
  config.lograge.base_controller_class = ['ActionController::API', 'ActionController::Base']

  config.lograge.custom_options = ->(_event) do
    { time: Time.zone.now }
  end

  config.lograge.formatter = Lograge::Formatters::Logstash.new
end
