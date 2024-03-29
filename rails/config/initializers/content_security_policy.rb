# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy.
# See the Securing Rails Applications Guide for more information:
# https://guides.rubyonrails.org/security.html#content-security-policy-header

Rails.application.config.content_security_policy do |policy|
  policy.default_src :self, :https
  policy.font_src    :self, :https, :data
  policy.img_src     :self, :https, :data
  policy.object_src  :none
  policy.script_src  :self, :https, :unsafe_inline
    # Allow @vite/client to hot reload javascript changes in development
  policy.script_src(*policy.script_src, "http://#{ViteRuby.config.host_with_port}") if Rails.env.development?
    # You may need to enable this in production as well depending on your setup.
#    policy.script_src *policy.script_src, :blob if Rails.env.test?

  policy.style_src :self, :https
    # Allow @vite/client to hot reload style changes in development
  policy.style_src(*policy.style_src, :unsafe_inline) if Rails.env.development?
  if Rails.env.development?
    policy.connect_src :self, :https, "http://#{ViteRuby.config.host_with_port}", "ws://#{ViteRuby.config.host_with_port}"
  end
    # Allow @vite/client to hot reload changes in development
  policy.connect_src(*policy.connect_src, "ws://#{ViteRuby.config.host_with_port}") if Rails.env.development?

  # Specify URI for violation reports
  # policy.report_uri "/csp-violation-report-endpoint"
end
