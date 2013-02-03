require "simplest_view/version"

module SimplestView
  def self.included(controller)
    controller.view_paths = ['app/templates']
  end

  def view_context_class_name
    @_view_context_class_name ||= begin
      controller = self.class.name.sub(/Controller$/, "").underscore
      action = action_name + "_view"

      File.join(controller, action).camelize
    end
  end

  # Rails 3/4
  def view_context_class
    begin
      klass = view_context_class_name.constantize

      routes = respond_to?(:_routes) && _routes
      helpers = respond_to?(:_helpers) && _helpers

      Class.new(klass) do
        if routes
          include routes.url_helpers
          include routes.mounted_helpers
        end

        if helpers
          include helpers
        end
      end
    rescue NameError => e
      Rails.logger.warn "No View defined for #{view_context_class_name}"
      super
    end
  end
end
