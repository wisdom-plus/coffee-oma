# frozen_string_literal: true

colorize_logs_formatter = ColorizeLogs::Formatter.new

colorize_logs_formatter.configure do
  match(/Processing by/, &:red)

  match(/Rendering layout/, &:green)

  match(/Rendering.*within layouts/, &:green)

  match(/app\/views/, &:green)

  match(/Started/, &:yellow)

  match(/Completed/, &:yellow)

  match(/Rendered/, &:purple)
end

if Rails.env.development?
  Rails.logger.formatter = colorize_logs_formatter
end
