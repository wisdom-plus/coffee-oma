# == Route Map
#
#                                   Prefix Verb       URI Pattern                                                                                       Controller#Action
#                   new_admin_user_session GET        /admin/login(.:format)                                                                            active_admin/devise/sessions#new
#                       admin_user_session POST       /admin/login(.:format)                                                                            active_admin/devise/sessions#create
#               destroy_admin_user_session DELETE|GET /admin/logout(.:format)                                                                           active_admin/devise/sessions#destroy
#                  new_admin_user_password GET        /admin/password/new(.:format)                                                                     active_admin/devise/passwords#new
#                 edit_admin_user_password GET        /admin/password/edit(.:format)                                                                    active_admin/devise/passwords#edit
#                      admin_user_password PATCH      /admin/password(.:format)                                                                         active_admin/devise/passwords#update
#                                          PUT        /admin/password(.:format)                                                                         active_admin/devise/passwords#update
#                                          POST       /admin/password(.:format)                                                                         active_admin/devise/passwords#create
#                               admin_root GET        /admin(.:format)                                                                                  admin/dashboard#index
#           batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format)                                                         admin/admin_users#batch_action
#                        admin_admin_users GET        /admin/admin_users(.:format)                                                                      admin/admin_users#index
#                                          POST       /admin/admin_users(.:format)                                                                      admin/admin_users#create
#                     new_admin_admin_user GET        /admin/admin_users/new(.:format)                                                                  admin/admin_users#new
#                    edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)                                                             admin/admin_users#edit
#                         admin_admin_user GET        /admin/admin_users/:id(.:format)                                                                  admin/admin_users#show
#                                          PATCH      /admin/admin_users/:id(.:format)                                                                  admin/admin_users#update
#                                          PUT        /admin/admin_users/:id(.:format)                                                                  admin/admin_users#update
#                                          DELETE     /admin/admin_users/:id(.:format)                                                                  admin/admin_users#destroy
#            batch_action_admin_bean_likes POST       /admin/bean_likes/batch_action(.:format)                                                          admin/bean_likes#batch_action
#                         admin_bean_likes GET        /admin/bean_likes(.:format)                                                                       admin/bean_likes#index
#                                          POST       /admin/bean_likes(.:format)                                                                       admin/bean_likes#create
#                      new_admin_bean_like GET        /admin/bean_likes/new(.:format)                                                                   admin/bean_likes#new
#                     edit_admin_bean_like GET        /admin/bean_likes/:id/edit(.:format)                                                              admin/bean_likes#edit
#                          admin_bean_like GET        /admin/bean_likes/:id(.:format)                                                                   admin/bean_likes#show
#                                          PATCH      /admin/bean_likes/:id(.:format)                                                                   admin/bean_likes#update
#                                          PUT        /admin/bean_likes/:id(.:format)                                                                   admin/bean_likes#update
#                                          DELETE     /admin/bean_likes/:id(.:format)                                                                   admin/bean_likes#destroy
#     batch_action_admin_bean_review_likes POST       /admin/bean_review_likes/batch_action(.:format)                                                   admin/bean_review_likes#batch_action
#                  admin_bean_review_likes GET        /admin/bean_review_likes(.:format)                                                                admin/bean_review_likes#index
#                                          POST       /admin/bean_review_likes(.:format)                                                                admin/bean_review_likes#create
#               new_admin_bean_review_like GET        /admin/bean_review_likes/new(.:format)                                                            admin/bean_review_likes#new
#              edit_admin_bean_review_like GET        /admin/bean_review_likes/:id/edit(.:format)                                                       admin/bean_review_likes#edit
#                   admin_bean_review_like GET        /admin/bean_review_likes/:id(.:format)                                                            admin/bean_review_likes#show
#                                          PATCH      /admin/bean_review_likes/:id(.:format)                                                            admin/bean_review_likes#update
#                                          PUT        /admin/bean_review_likes/:id(.:format)                                                            admin/bean_review_likes#update
#                                          DELETE     /admin/bean_review_likes/:id(.:format)                                                            admin/bean_review_likes#destroy
#          batch_action_admin_bean_reviews POST       /admin/bean_reviews/batch_action(.:format)                                                        admin/bean_reviews#batch_action
#                       admin_bean_reviews GET        /admin/bean_reviews(.:format)                                                                     admin/bean_reviews#index
#                                          POST       /admin/bean_reviews(.:format)                                                                     admin/bean_reviews#create
#                    new_admin_bean_review GET        /admin/bean_reviews/new(.:format)                                                                 admin/bean_reviews#new
#                   edit_admin_bean_review GET        /admin/bean_reviews/:id/edit(.:format)                                                            admin/bean_reviews#edit
#                        admin_bean_review GET        /admin/bean_reviews/:id(.:format)                                                                 admin/bean_reviews#show
#                                          PATCH      /admin/bean_reviews/:id(.:format)                                                                 admin/bean_reviews#update
#                                          PUT        /admin/bean_reviews/:id(.:format)                                                                 admin/bean_reviews#update
#                                          DELETE     /admin/bean_reviews/:id(.:format)                                                                 admin/bean_reviews#destroy
#                 batch_action_admin_beans POST       /admin/beans/batch_action(.:format)                                                               admin/beans#batch_action
#                              admin_beans GET        /admin/beans(.:format)                                                                            admin/beans#index
#                                          POST       /admin/beans(.:format)                                                                            admin/beans#create
#                           new_admin_bean GET        /admin/beans/new(.:format)                                                                        admin/beans#new
#                          edit_admin_bean GET        /admin/beans/:id/edit(.:format)                                                                   admin/beans#edit
#                               admin_bean GET        /admin/beans/:id(.:format)                                                                        admin/beans#show
#                                          PATCH      /admin/beans/:id(.:format)                                                                        admin/beans#update
#                                          PUT        /admin/beans/:id(.:format)                                                                        admin/beans#update
#                                          DELETE     /admin/beans/:id(.:format)                                                                        admin/beans#destroy
#              batch_action_admin_contacts POST       /admin/contacts/batch_action(.:format)                                                            admin/contacts#batch_action
#                           admin_contacts GET        /admin/contacts(.:format)                                                                         admin/contacts#index
#                                          POST       /admin/contacts(.:format)                                                                         admin/contacts#create
#                        new_admin_contact GET        /admin/contacts/new(.:format)                                                                     admin/contacts#new
#                       edit_admin_contact GET        /admin/contacts/:id/edit(.:format)                                                                admin/contacts#edit
#                            admin_contact GET        /admin/contacts/:id(.:format)                                                                     admin/contacts#show
#                                          PATCH      /admin/contacts/:id(.:format)                                                                     admin/contacts#update
#                                          PUT        /admin/contacts/:id(.:format)                                                                     admin/contacts#update
#                                          DELETE     /admin/contacts/:id(.:format)                                                                     admin/contacts#destroy
#                          admin_dashboard GET        /admin/dashboard(.:format)                                                                        admin/dashboard#index
#             batch_action_admin_histories POST       /admin/histories/batch_action(.:format)                                                           admin/histories#batch_action
#                          admin_histories GET        /admin/histories(.:format)                                                                        admin/histories#index
#                                          POST       /admin/histories(.:format)                                                                        admin/histories#create
#                        new_admin_history GET        /admin/histories/new(.:format)                                                                    admin/histories#new
#                       edit_admin_history GET        /admin/histories/:id/edit(.:format)                                                               admin/histories#edit
#                            admin_history GET        /admin/histories/:id(.:format)                                                                    admin/histories#show
#                                          PATCH      /admin/histories/:id(.:format)                                                                    admin/histories#update
#                                          PUT        /admin/histories/:id(.:format)                                                                    admin/histories#update
#                                          DELETE     /admin/histories/:id(.:format)                                                                    admin/histories#destroy
#              batch_action_admin_messages POST       /admin/messages/batch_action(.:format)                                                            admin/messages#batch_action
#                           admin_messages GET        /admin/messages(.:format)                                                                         admin/messages#index
#                                          POST       /admin/messages(.:format)                                                                         admin/messages#create
#                        new_admin_message GET        /admin/messages/new(.:format)                                                                     admin/messages#new
#                       edit_admin_message GET        /admin/messages/:id/edit(.:format)                                                                admin/messages#edit
#                            admin_message GET        /admin/messages/:id(.:format)                                                                     admin/messages#show
#                                          PATCH      /admin/messages/:id(.:format)                                                                     admin/messages#update
#                                          PUT        /admin/messages/:id(.:format)                                                                     admin/messages#update
#                                          DELETE     /admin/messages/:id(.:format)                                                                     admin/messages#destroy
#         batch_action_admin_notifications POST       /admin/notifications/batch_action(.:format)                                                       admin/notifications#batch_action
#                      admin_notifications GET        /admin/notifications(.:format)                                                                    admin/notifications#index
#                                          POST       /admin/notifications(.:format)                                                                    admin/notifications#create
#                   new_admin_notification GET        /admin/notifications/new(.:format)                                                                admin/notifications#new
#                  edit_admin_notification GET        /admin/notifications/:id/edit(.:format)                                                           admin/notifications#edit
#                       admin_notification GET        /admin/notifications/:id(.:format)                                                                admin/notifications#show
#                                          PATCH      /admin/notifications/:id(.:format)                                                                admin/notifications#update
#                                          PUT        /admin/notifications/:id(.:format)                                                                admin/notifications#update
#                                          DELETE     /admin/notifications/:id(.:format)                                                                admin/notifications#destroy
#         batch_action_admin_product_likes POST       /admin/product_likes/batch_action(.:format)                                                       admin/product_likes#batch_action
#                      admin_product_likes GET        /admin/product_likes(.:format)                                                                    admin/product_likes#index
#                                          POST       /admin/product_likes(.:format)                                                                    admin/product_likes#create
#                   new_admin_product_like GET        /admin/product_likes/new(.:format)                                                                admin/product_likes#new
#                  edit_admin_product_like GET        /admin/product_likes/:id/edit(.:format)                                                           admin/product_likes#edit
#                       admin_product_like GET        /admin/product_likes/:id(.:format)                                                                admin/product_likes#show
#                                          PATCH      /admin/product_likes/:id(.:format)                                                                admin/product_likes#update
#                                          PUT        /admin/product_likes/:id(.:format)                                                                admin/product_likes#update
#                                          DELETE     /admin/product_likes/:id(.:format)                                                                admin/product_likes#destroy
#  batch_action_admin_product_review_likes POST       /admin/product_review_likes/batch_action(.:format)                                                admin/product_review_likes#batch_action
#               admin_product_review_likes GET        /admin/product_review_likes(.:format)                                                             admin/product_review_likes#index
#                                          POST       /admin/product_review_likes(.:format)                                                             admin/product_review_likes#create
#            new_admin_product_review_like GET        /admin/product_review_likes/new(.:format)                                                         admin/product_review_likes#new
#           edit_admin_product_review_like GET        /admin/product_review_likes/:id/edit(.:format)                                                    admin/product_review_likes#edit
#                admin_product_review_like GET        /admin/product_review_likes/:id(.:format)                                                         admin/product_review_likes#show
#                                          PATCH      /admin/product_review_likes/:id(.:format)                                                         admin/product_review_likes#update
#                                          PUT        /admin/product_review_likes/:id(.:format)                                                         admin/product_review_likes#update
#                                          DELETE     /admin/product_review_likes/:id(.:format)                                                         admin/product_review_likes#destroy
#              batch_action_admin_products POST       /admin/products/batch_action(.:format)                                                            admin/products#batch_action
#                           admin_products GET        /admin/products(.:format)                                                                         admin/products#index
#                                          POST       /admin/products(.:format)                                                                         admin/products#create
#                        new_admin_product GET        /admin/products/new(.:format)                                                                     admin/products#new
#                       edit_admin_product GET        /admin/products/:id/edit(.:format)                                                                admin/products#edit
#                            admin_product GET        /admin/products/:id(.:format)                                                                     admin/products#show
#                                          PATCH      /admin/products/:id(.:format)                                                                     admin/products#update
#                                          PUT        /admin/products/:id(.:format)                                                                     admin/products#update
#                                          DELETE     /admin/products/:id(.:format)                                                                     admin/products#destroy
#               batch_action_admin_recipes POST       /admin/recipes/batch_action(.:format)                                                             admin/recipes#batch_action
#                            admin_recipes GET        /admin/recipes(.:format)                                                                          admin/recipes#index
#                                          POST       /admin/recipes(.:format)                                                                          admin/recipes#create
#                         new_admin_recipe GET        /admin/recipes/new(.:format)                                                                      admin/recipes#new
#                        edit_admin_recipe GET        /admin/recipes/:id/edit(.:format)                                                                 admin/recipes#edit
#                             admin_recipe GET        /admin/recipes/:id(.:format)                                                                      admin/recipes#show
#                                          PATCH      /admin/recipes/:id(.:format)                                                                      admin/recipes#update
#                                          PUT        /admin/recipes/:id(.:format)                                                                      admin/recipes#update
#                                          DELETE     /admin/recipes/:id(.:format)                                                                      admin/recipes#destroy
#         batch_action_admin_relationships POST       /admin/relationships/batch_action(.:format)                                                       admin/relationships#batch_action
#                      admin_relationships GET        /admin/relationships(.:format)                                                                    admin/relationships#index
#                                          POST       /admin/relationships(.:format)                                                                    admin/relationships#create
#                   new_admin_relationship GET        /admin/relationships/new(.:format)                                                                admin/relationships#new
#                  edit_admin_relationship GET        /admin/relationships/:id/edit(.:format)                                                           admin/relationships#edit
#                       admin_relationship GET        /admin/relationships/:id(.:format)                                                                admin/relationships#show
#                                          PATCH      /admin/relationships/:id(.:format)                                                                admin/relationships#update
#                                          PUT        /admin/relationships/:id(.:format)                                                                admin/relationships#update
#                                          DELETE     /admin/relationships/:id(.:format)                                                                admin/relationships#destroy
#               batch_action_admin_reports POST       /admin/reports/batch_action(.:format)                                                             admin/reports#batch_action
#                            admin_reports GET        /admin/reports(.:format)                                                                          admin/reports#index
#                                          POST       /admin/reports(.:format)                                                                          admin/reports#create
#                         new_admin_report GET        /admin/reports/new(.:format)                                                                      admin/reports#new
#                        edit_admin_report GET        /admin/reports/:id/edit(.:format)                                                                 admin/reports#edit
#                             admin_report GET        /admin/reports/:id(.:format)                                                                      admin/reports#show
#                                          PATCH      /admin/reports/:id(.:format)                                                                      admin/reports#update
#                                          PUT        /admin/reports/:id(.:format)                                                                      admin/reports#update
#                                          DELETE     /admin/reports/:id(.:format)                                                                      admin/reports#destroy
#               batch_action_admin_reviews POST       /admin/reviews/batch_action(.:format)                                                             admin/reviews#batch_action
#                            admin_reviews GET        /admin/reviews(.:format)                                                                          admin/reviews#index
#                                          POST       /admin/reviews(.:format)                                                                          admin/reviews#create
#                         new_admin_review GET        /admin/reviews/new(.:format)                                                                      admin/reviews#new
#                        edit_admin_review GET        /admin/reviews/:id/edit(.:format)                                                                 admin/reviews#edit
#                             admin_review GET        /admin/reviews/:id(.:format)                                                                      admin/reviews#show
#                                          PATCH      /admin/reviews/:id(.:format)                                                                      admin/reviews#update
#                                          PUT        /admin/reviews/:id(.:format)                                                                      admin/reviews#update
#                                          DELETE     /admin/reviews/:id(.:format)                                                                      admin/reviews#destroy
#                 batch_action_admin_rooms POST       /admin/rooms/batch_action(.:format)                                                               admin/rooms#batch_action
#                              admin_rooms GET        /admin/rooms(.:format)                                                                            admin/rooms#index
#                                          POST       /admin/rooms(.:format)                                                                            admin/rooms#create
#                           new_admin_room GET        /admin/rooms/new(.:format)                                                                        admin/rooms#new
#                          edit_admin_room GET        /admin/rooms/:id/edit(.:format)                                                                   admin/rooms#edit
#                               admin_room GET        /admin/rooms/:id(.:format)                                                                        admin/rooms#show
#                                          PATCH      /admin/rooms/:id(.:format)                                                                        admin/rooms#update
#                                          PUT        /admin/rooms/:id(.:format)                                                                        admin/rooms#update
#                                          DELETE     /admin/rooms/:id(.:format)                                                                        admin/rooms#destroy
#                 batch_action_admin_users POST       /admin/users/batch_action(.:format)                                                               admin/users#batch_action
#                              admin_users GET        /admin/users(.:format)                                                                            admin/users#index
#                                          POST       /admin/users(.:format)                                                                            admin/users#create
#                           new_admin_user GET        /admin/users/new(.:format)                                                                        admin/users#new
#                          edit_admin_user GET        /admin/users/:id/edit(.:format)                                                                   admin/users#edit
#                               admin_user GET        /admin/users/:id(.:format)                                                                        admin/users#show
#                                          PATCH      /admin/users/:id(.:format)                                                                        admin/users#update
#                                          PUT        /admin/users/:id(.:format)                                                                        admin/users#update
#                                          DELETE     /admin/users/:id(.:format)                                                                        admin/users#destroy
#                           admin_comments GET        /admin/comments(.:format)                                                                         admin/comments#index
#                                          POST       /admin/comments(.:format)                                                                         admin/comments#create
#                            admin_comment GET        /admin/comments/:id(.:format)                                                                     admin/comments#show
#                                          DELETE     /admin/comments/:id(.:format)                                                                     admin/comments#destroy
#                                     root GET        /                                                                                                 home#top
#                           private_policy GET        /private_policy(.:format)                                                                         home#private_policy
#                                   policy GET        /policy(.:format)                                                                                 home#policy
#                         new_user_session GET        /users/sign_in(.:format)                                                                          devise/sessions#new
#                             user_session POST       /users/sign_in(.:format)                                                                          devise/sessions#create
#                     destroy_user_session DELETE     /users/sign_out(.:format)                                                                         devise/sessions#destroy
#                        new_user_password GET        /users/password/new(.:format)                                                                     devise/passwords#new
#                       edit_user_password GET        /users/password/edit(.:format)                                                                    devise/passwords#edit
#                            user_password PATCH      /users/password(.:format)                                                                         devise/passwords#update
#                                          PUT        /users/password(.:format)                                                                         devise/passwords#update
#                                          POST       /users/password(.:format)                                                                         devise/passwords#create
#                 cancel_user_registration GET        /users/cancel(.:format)                                                                           users/registrations#cancel
#                    new_user_registration GET        /users/sign_up(.:format)                                                                          users/registrations#new
#                   edit_user_registration GET        /users/edit(.:format)                                                                             users/registrations#edit
#                        user_registration PATCH      /users(.:format)                                                                                  users/registrations#update
#                                          PUT        /users(.:format)                                                                                  users/registrations#update
#                                          DELETE     /users(.:format)                                                                                  users/registrations#destroy
#                                          POST       /users(.:format)                                                                                  users/registrations#create
#                    new_user_confirmation GET        /users/confirmation/new(.:format)                                                                 devise/confirmations#new
#                        user_confirmation GET        /users/confirmation(.:format)                                                                     devise/confirmations#show
#                                          POST       /users/confirmation(.:format)                                                                     devise/confirmations#create
#                                          GET        /users/:id/show(.:format)                                                                         users/registrations#show
#                      users_guest_sign_in POST       /users/guest_sign_in(.:format)                                                                    users/sessions#new_guest
#                          product_reviews POST       /products/:product_id/reviews(.:format)                                                           reviews#create
#                           product_review DELETE     /products/:product_id/reviews/:id(.:format)                                                       reviews#destroy
#                                 products GET        /products(.:format)                                                                               products#index
#                                          POST       /products(.:format)                                                                               products#create
#                              new_product GET        /products/new(.:format)                                                                           products#new
#                                  product GET        /products/:id(.:format)                                                                           products#show
#                                    likes GET        /likes(.:format)                                                                                  likes#index
#                                          POST       /likes(.:format)                                                                                  likes#create
#                                     like DELETE     /likes/:id(.:format)                                                                              likes#destroy
#                             review_likes POST       /review_likes(.:format)                                                                           review_likes#create
#                              review_like DELETE     /review_likes/:id(.:format)                                                                       review_likes#destroy
#                            relationships POST       /relationships(.:format)                                                                          relationships#create
#                             relationship DELETE     /relationships/:id(.:format)                                                                      relationships#destroy
#                                 contacts POST       /contacts(.:format)                                                                               contacts#create
#                              new_contact GET        /contacts/new(.:format)                                                                           contacts#new
#                            notifications GET        /notifications(.:format)                                                                          notifications#index
#                                    rooms GET        /rooms(.:format)                                                                                  rooms#index
#                                          POST       /rooms(.:format)                                                                                  rooms#create
#                                     room GET        /rooms/:id(.:format)                                                                              rooms#show
#                                 messages POST       /messages(.:format)                                                                               messages#create
#                                  reports POST       /reports(.:format)                                                                                reports#create
#                                histories GET        /histories(.:format)                                                                              histories#index
#                                      tag PATCH      /tags/:id(.:format)                                                                               tags#update
#                                          PUT        /tags/:id(.:format)                                                                               tags#update
#                               news_index GET        /news(.:format)                                                                                   news#index
#                                          POST       /news(.:format)                                                                                   news#create
#                                 new_news GET        /news/new(.:format)                                                                               news#new
#                                edit_news GET        /news/:id/edit(.:format)                                                                          news#edit
#                                     news GET        /news/:id(.:format)                                                                               news#show
#                                          PATCH      /news/:id(.:format)                                                                               news#update
#                                          PUT        /news/:id(.:format)                                                                               news#update
#                                          DELETE     /news/:id(.:format)                                                                               news#destroy
#                        bean_bean_reviews POST       /beans/:bean_id/bean_reviews(.:format)                                                            bean_reviews#create
#                         bean_bean_review DELETE     /beans/:bean_id/bean_reviews/:id(.:format)                                                        bean_reviews#destroy
#                                    beans GET        /beans(.:format)                                                                                  beans#index
#                                          POST       /beans(.:format)                                                                                  beans#create
#                                 new_bean GET        /beans/new(.:format)                                                                              beans#new
#                                edit_bean GET        /beans/:id/edit(.:format)                                                                         beans#edit
#                                     bean GET        /beans/:id(.:format)                                                                              beans#show
#                                          PATCH      /beans/:id(.:format)                                                                              beans#update
#                                          PUT        /beans/:id(.:format)                                                                              beans#update
#                                          DELETE     /beans/:id(.:format)                                                                              beans#destroy
#                              api_vi_tags GET        /api/vi/tags(.:format)                                                                            api/vi/tags#index {:format=>/json/}
#                        letter_opener_web            /letter_opener                                                                                    LetterOpenerWeb::Engine
#            rails_postmark_inbound_emails POST       /rails/action_mailbox/postmark/inbound_emails(.:format)                                           action_mailbox/ingresses/postmark/inbound_emails#create
#               rails_relay_inbound_emails POST       /rails/action_mailbox/relay/inbound_emails(.:format)                                              action_mailbox/ingresses/relay/inbound_emails#create
#            rails_sendgrid_inbound_emails POST       /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                           action_mailbox/ingresses/sendgrid/inbound_emails#create
#      rails_mandrill_inbound_health_check GET        /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#health_check
#            rails_mandrill_inbound_emails POST       /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#create
#             rails_mailgun_inbound_emails POST       /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                                       action_mailbox/ingresses/mailgun/inbound_emails#create
#           rails_conductor_inbound_emails GET        /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#index
#                                          POST       /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#create
#        new_rails_conductor_inbound_email GET        /rails/conductor/action_mailbox/inbound_emails/new(.:format)                                      rails/conductor/action_mailbox/inbound_emails#new
#       edit_rails_conductor_inbound_email GET        /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                                 rails/conductor/action_mailbox/inbound_emails#edit
#            rails_conductor_inbound_email GET        /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#show
#                                          PATCH      /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
#                                          PUT        /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
#                                          DELETE     /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#destroy
# new_rails_conductor_inbound_email_source GET        /rails/conductor/action_mailbox/inbound_emails/sources/new(.:format)                              rails/conductor/action_mailbox/inbound_emails/sources#new
#    rails_conductor_inbound_email_sources POST       /rails/conductor/action_mailbox/inbound_emails/sources(.:format)                                  rails/conductor/action_mailbox/inbound_emails/sources#create
#    rails_conductor_inbound_email_reroute POST       /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                               rails/conductor/action_mailbox/reroutes#create
#                       rails_service_blob GET        /rails/active_storage/blobs/redirect/:signed_id/*filename(.:format)                               active_storage/blobs/redirect#show
#                 rails_service_blob_proxy GET        /rails/active_storage/blobs/proxy/:signed_id/*filename(.:format)                                  active_storage/blobs/proxy#show
#                                          GET        /rails/active_storage/blobs/:signed_id/*filename(.:format)                                        active_storage/blobs/redirect#show
#                rails_blob_representation GET        /rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations/redirect#show
#          rails_blob_representation_proxy GET        /rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename(.:format)    active_storage/representations/proxy#show
#                                          GET        /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)          active_storage/representations/redirect#show
#                       rails_disk_service GET        /rails/active_storage/disk/:encoded_key/*filename(.:format)                                       active_storage/disk#show
#                update_rails_disk_service PUT        /rails/active_storage/disk/:encoded_token(.:format)                                               active_storage/disk#update
#                     rails_direct_uploads POST       /rails/active_storage/direct_uploads(.:format)                                                    active_storage/direct_uploads#create
#
# Routes for LetterOpenerWeb::Engine:
# clear_letters DELETE /clear(.:format)                 letter_opener_web/letters#clear
# delete_letter DELETE /:id(.:format)                   letter_opener_web/letters#destroy
#       letters GET    /                                letter_opener_web/letters#index
#        letter GET    /:id(/:style)(.:format)          letter_opener_web/letters#show
#               GET    /:id/attachments/:file(.:format) letter_opener_web/letters#attachment

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#top'
  get '/private_policy' => 'home#private_policy'
  get '/policy' => 'home#policy'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get 'users/:id/show' => 'users/registrations#show'
    get 'users/my_page' => 'users/registrations#my_page'
    post 'users/guest_sign_in' => 'users/sessions#new_guest'
    get 'api/v1/auth/registrations/:id' => 'api/v1/auth/registrations#show'
    get 'api/v1/auth/guest_login' => 'api/v1/auth/sessions#guest_login'
  end
  resources :products, only: %i[new create index show] do
    resources :reviews, only: %i[create destroy]
  end
  resources :likes, only: %i[create destroy index]
  resources :review_likes, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
  resources :contacts, only: %i[new create]
  resources :notifications, only: :index
  resources :rooms, only: %i[show create index new]
  resources :messages, only: %i[create]
  resources :reports, only: %i[create]
  resources :histories, only: %i[index]
  resources :tags, only: %i[update create]
  resources :news
  resources :beans do
    resources :bean_reviews, only: %i[create destroy]
  end
  resources :brands

  namespace :component do
    resources :likes, only: [] do
      get 'home', on: :collection
    end
    resources :reviews, only: [] do
      get 'home', on: :collection
    end
  end

  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :tags, only: %i[index]
      resources :brands, only: %i[index]
      resources :healths, only: %i[index]
      resources :products, only: %i[index show create] do
        resources :reviews, only: %i[create destroy] do
          collection do
            get 'exists'
          end
        end
      end
      resources :likes, only: %i[create destroy index] do
        collection do
          get 'exists'
        end
      end
      resources :relationships, only: %i[create destroy] do
        collection do
          get 'exists'
        end
      end
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations',
        token_validations: 'api/v1/auth/token_validations',
        passwords: 'api/v1/auth/passwords',
        sessions: 'api/v1/auth/sessions'
      }
    end
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  mount Sidekiq::Web => '/sidekiq'
end
