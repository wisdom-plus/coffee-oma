# Rails.application.config.session_store :redis_store,
#                                        servers: [ENV.fetch('REDIS_URL', nil)],
#                                        expire_after: 1.day,
#                                        key: "_#{Rails.application.class.module_parent_name.downcase}_session",
#                                        threadsafe: true,
#                                        secure: true
