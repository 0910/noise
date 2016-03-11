class CustomTemplateResolver < ActionView::Resolver
  def find_templates(name, prefix, partial, details)
    festival = details.fetch(:festivals).first

    source = festival.template

    name = "_#{name}" if partial
    path = [prefix, name].compact.join("/")

    # This needs to be different for each template. Perhaps
    # use a digest of the template source.
    identifier = ["template", festival.id].join("-")

    # Get the Curly handler
    handler = ActionView::Template.handler_for_extension(:curly)

    details = {
      format: :html,
      updated_at: festival.updated_at, # important if you want to
                                      # cache the compiled templates.
      virtual_path: path
    }

    # Return a new template object wrapped in an array
    [ActionView::Template.new(source, identifier, handler, details)]
  end
end