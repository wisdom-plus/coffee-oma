secure = Rails.env.production?

Rails.application.config.session_store :redis_store,
                                       servers: ["#{ENV.fetch('REDIS_URL', nil)}/0/session"],
                                       expire_after: 1.day,
                                       key: "_#{Rails.application.class.module_parent_name.downcase}_session",
                                       threadsafe: true,
                                       secure: secure

if Rails.env.test?
  Rails.application.config.session_store :cookie_store, key: "_#{Rails.application.class.module_parent_name.downcase}_session"
end
