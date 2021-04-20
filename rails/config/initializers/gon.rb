Gon.global.tag_form_url = if Rails.env.production?
                            ENV['TAG_URL']
                          else
                            ENV['TAG_LOCAL_URL']
                          end
