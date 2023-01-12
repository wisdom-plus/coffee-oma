module TurboStreamComponent
  extend ActiveSupport::Concern

  def turbo_stream_flash(message)
    turbo_stream.replace(
      'flash',
      Flash::Component.new(flash: message).render_in(view_context)
    )
  end

  def turbo_stream_component_replace(name, *args, **kwargs)
    component = name.to_s.camelize.constantize::Component
    turbo_stream.replace(name, component.new(*args, **kwargs).render_in(view_context))
  end
end
