Gon.global.tag_form_url = if Rails.env.production?
                            ENV.fetch('TAG_URL', nil)
                          else
                            ENV.fetch('TAG_LOCAL_URL', nil)
                          end
