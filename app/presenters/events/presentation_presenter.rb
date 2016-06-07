class Events::PresentationPresenter < Curly::Presenter

  presents :event, :presentation

  def name
    @presentation.name
  end

  def time
    @presentation.time.to_date.to_formatted_s(:short)
  end

  def duration
    @presentation.duration
  end

  def description
    SafeMarkdown.render(@presentation.bio)
  end

end