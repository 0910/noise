class Festivals::StagePresenter < Curly::Presenter

  presents :festival, :stage

  def name
    @stage.name
  end

  def slug
    @stage.slug
  end

  def presentations
    @stage.presentations.order(starts_on: :asc)
  end

end