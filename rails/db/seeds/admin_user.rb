AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
if Rails.env.production?
  AdminUser.create!(email: 'admin@example.com', password: ENV.fetch('ADMIN_PASSWORD', nil),
                    password_confirmation: ENV.fetch('ADMIN_PASSWORD]', nil))
end
puts 'Admin user created'
