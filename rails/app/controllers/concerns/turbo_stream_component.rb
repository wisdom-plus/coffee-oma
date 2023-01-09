module TurboStreamComponent
  extend ActiveSupport::Concern

  def turbo_stream_flash(message, view_context)
    turbo_stream.replace(
      'flash',
      Flash::Component.new(flash: message).render_in(view_context)
    )
  end
end
