# == Route Map
#
#                                Prefix Verb       URI Pattern                                                                              Controller#Action
#                new_admin_user_session GET        /admin/login(.:format)                                                                   active_admin/devise/sessions#new
#                    admin_user_session POST       /admin/login(.:format)                                                                   active_admin/devise/sessions#create
#            destroy_admin_user_session DELETE|GET /admin/logout(.:format)                                                                  active_admin/devise/sessions#destroy
#               new_admin_user_password GET        /admin/password/new(.:format)                                                            active_admin/devise/passwords#new
#              edit_admin_user_password GET        /admin/password/edit(.:format)                                                           active_admin/devise/passwords#edit
#                   admin_user_password PATCH      /admin/password(.:format)                                                                active_admin/devise/passwords#update
#                                       PUT        /admin/password(.:format)                                                                active_admin/devise/passwords#update
#                                       POST       /admin/password(.:format)                                                                active_admin/devise/passwords#create
#                            admin_root GET        /admin(.:format)                                                                         admin/dashboard#index
#        batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format)                                                admin/admin_users#batch_action
#                     admin_admin_users GET        /admin/admin_users(.:format)                                                             admin/admin_users#index
#                                       POST       /admin/admin_users(.:format)                                                             admin/admin_users#create
#                  new_admin_admin_user GET        /admin/admin_users/new(.:format)                                                         admin/admin_users#new
#                 edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)                                                    admin/admin_users#edit
#                      admin_admin_user GET        /admin/admin_users/:id(.:format)                                                         admin/admin_users#show
#                                       PATCH      /admin/admin_users/:id(.:format)                                                         admin/admin_users#update
#                                       PUT        /admin/admin_users/:id(.:format)                                                         admin/admin_users#update
#                                       DELETE     /admin/admin_users/:id(.:format)                                                         admin/admin_users#destroy
#                       admin_dashboard GET        /admin/dashboard(.:format)                                                               admin/dashboard#index
#           batch_action_admin_products POST       /admin/products/batch_action(.:format)                                                   admin/products#batch_action
#                        admin_products GET        /admin/products(.:format)                                                                admin/products#index
#                                       POST       /admin/products(.:format)                                                                admin/products#create
#                     new_admin_product GET        /admin/products/new(.:format)                                                            admin/products#new
#                    edit_admin_product GET        /admin/products/:id/edit(.:format)                                                       admin/products#edit
#                         admin_product GET        /admin/products/:id(.:format)                                                            admin/products#show
#                                       PATCH      /admin/products/:id(.:format)                                                            admin/products#update
#                                       PUT        /admin/products/:id(.:format)                                                            admin/products#update
#                                       DELETE     /admin/products/:id(.:format)                                                            admin/products#destroy
#            batch_action_admin_reviews POST       /admin/reviews/batch_action(.:format)                                                    admin/reviews#batch_action
#                         admin_reviews GET        /admin/reviews(.:format)                                                                 admin/reviews#index
#                                       POST       /admin/reviews(.:format)                                                                 admin/reviews#create
#                      new_admin_review GET        /admin/reviews/new(.:format)                                                             admin/reviews#new
#                     edit_admin_review GET        /admin/reviews/:id/edit(.:format)                                                        admin/reviews#edit
#                          admin_review GET        /admin/reviews/:id(.:format)                                                             admin/reviews#show
#                                       PATCH      /admin/reviews/:id(.:format)                                                             admin/reviews#update
#                                       PUT        /admin/reviews/:id(.:format)                                                             admin/reviews#update
#                                       DELETE     /admin/reviews/:id(.:format)                                                             admin/reviews#destroy
#               batch_action_admin_tags POST       /admin/tags/batch_action(.:format)                                                       admin/tags#batch_action
#                            admin_tags GET        /admin/tags(.:format)                                                                    admin/tags#index
#                                       POST       /admin/tags(.:format)                                                                    admin/tags#create
#                         new_admin_tag GET        /admin/tags/new(.:format)                                                                admin/tags#new
#                        edit_admin_tag GET        /admin/tags/:id/edit(.:format)                                                           admin/tags#edit
#                             admin_tag GET        /admin/tags/:id(.:format)                                                                admin/tags#show
#                                       PATCH      /admin/tags/:id(.:format)                                                                admin/tags#update
#                                       PUT        /admin/tags/:id(.:format)                                                                admin/tags#update
#                                       DELETE     /admin/tags/:id(.:format)                                                                admin/tags#destroy
#              batch_action_admin_users POST       /admin/users/batch_action(.:format)                                                      admin/users#batch_action
#                           admin_users GET        /admin/users(.:format)                                                                   admin/users#index
#                                       POST       /admin/users(.:format)                                                                   admin/users#create
#                        new_admin_user GET        /admin/users/new(.:format)                                                               admin/users#new
#                       edit_admin_user GET        /admin/users/:id/edit(.:format)                                                          admin/users#edit
#                            admin_user GET        /admin/users/:id(.:format)                                                               admin/users#show
#                                       PATCH      /admin/users/:id(.:format)                                                               admin/users#update
#                                       PUT        /admin/users/:id(.:format)                                                               admin/users#update
#                                       DELETE     /admin/users/:id(.:format)                                                               admin/users#destroy
#                        admin_comments GET        /admin/comments(.:format)                                                                admin/comments#index
#                                       POST       /admin/comments(.:format)                                                                admin/comments#create
#                         admin_comment GET        /admin/comments/:id(.:format)                                                            admin/comments#show
#                                       DELETE     /admin/comments/:id(.:format)                                                            admin/comments#destroy
#                                  root GET        /                                                                                        home#top
#                        private_policy GET        /private_policy(.:format)                                                                home#private_policy
#                                policy GET        /policy(.:format)                                                                        home#policy
#                      new_user_session GET        /users/sign_in(.:format)                                                                 devise/sessions#new
#                          user_session POST       /users/sign_in(.:format)                                                                 devise/sessions#create
#                  destroy_user_session DELETE     /users/sign_out(.:format)                                                                devise/sessions#destroy
#                     new_user_password GET        /users/password/new(.:format)                                                            devise/passwords#new
#                    edit_user_password GET        /users/password/edit(.:format)                                                           devise/passwords#edit
#                         user_password PATCH      /users/password(.:format)                                                                devise/passwords#update
#                                       PUT        /users/password(.:format)                                                                devise/passwords#update
#                                       POST       /users/password(.:format)                                                                devise/passwords#create
#              cancel_user_registration GET        /users/cancel(.:format)                                                                  users/registrations#cancel
#                 new_user_registration GET        /users/sign_up(.:format)                                                                 users/registrations#new
#                edit_user_registration GET        /users/edit(.:format)                                                                    users/registrations#edit
#                     user_registration PATCH      /users(.:format)                                                                         users/registrations#update
#                                       PUT        /users(.:format)                                                                         users/registrations#update
#                                       DELETE     /users(.:format)                                                                         users/registrations#destroy
#                                       POST       /users(.:format)                                                                         users/registrations#create
#                 new_user_confirmation GET        /users/confirmation/new(.:format)                                                        devise/confirmations#new
#                     user_confirmation GET        /users/confirmation(.:format)                                                            devise/confirmations#show
#                                       POST       /users/confirmation(.:format)                                                            devise/confirmations#create
#                                       GET        /users/:id/show(.:format)                                                                users/registrations#show
#                   users_guest_sign_in POST       /users/guest_sign_in(.:format)                                                           users/sessions#new_guest
#               rakuten_create_products POST       /products/rakuten_create(.:format)                                                       products#rakuten_create
#                       product_reviews POST       /products/:product_id/reviews(.:format)                                                  reviews#create
#                              products GET        /products(.:format)                                                                      products#index
#                                       POST       /products(.:format)                                                                      products#create
#                           new_product GET        /products/new(.:format)                                                                  products#new
#                               product GET        /products/:id(.:format)                                                                  products#show
#                                       PATCH      /products/:id(.:format)                                                                  products#update
#                                       PUT        /products/:id(.:format)                                                                  products#update
#                                 likes GET        /likes(.:format)                                                                         likes#index
#                                       POST       /likes(.:format)                                                                         likes#create
#                                  like DELETE     /likes/:id(.:format)                                                                     likes#destroy
#                          review_likes POST       /review_likes(.:format)                                                                  review_likes#create
#                           review_like DELETE     /review_likes/:id(.:format)                                                              review_likes#destroy
#                         relationships POST       /relationships(.:format)                                                                 relationships#create
#                          relationship DELETE     /relationships/:id(.:format)                                                             relationships#destroy
#                              contacts POST       /contacts(.:format)                                                                      contacts#create
#                           new_contact GET        /contacts/new(.:format)                                                                  contacts#new
#                         notifications GET        /notifications(.:format)                                                                 notifications#index
#                                 rooms GET        /rooms(.:format)                                                                         rooms#index
#                                       POST       /rooms(.:format)                                                                         rooms#create
#                                  room GET        /rooms/:id(.:format)                                                                     rooms#show
#                              messages POST       /messages(.:format)                                                                      messages#create
#                               reports POST       /reports(.:format)                                                                       reports#create
#                     letter_opener_web            /letter_opener                                                                           LetterOpenerWeb::Engine
#         rails_postmark_inbound_emails POST       /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST       /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST       /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#   rails_mandrill_inbound_health_check GET        /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#         rails_mandrill_inbound_emails POST       /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#          rails_mailgun_inbound_emails POST       /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET        /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST       /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET        /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET        /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET        /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH      /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT        /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE     /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST       /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET        /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET        /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET        /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT        /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST       /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
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
    post 'users/guest_sign_in' => 'users/sessions#new_guest'
  end
  resources :products, only: %i[new create index show update] do
    collection do
      post 'rakuten_create'
    end
    resources :reviews, only: %i[create]
  end
  resources :likes, only: %i[create destroy index]
  resources :review_likes, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
  resources :contacts, only: %i[new create]
  resources :notifications, only: :index
  resources :rooms, only: %i[show create index]
  resources :messages, only: %i[create]
  resources :reports, only: %i[create]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
