class Festivals::DayPresenter < Curly::Presenter

  presents :festival, :day

  def name
    @day.name
  end

  def date
    @day.date.to_date.to_formatted_s(:long)
  end

  def short_date
    @day.date.to_date.to_formatted_s(:short)
  end

  def slug
    @day.slug
  end

  def stages
    @day.stages.order(name: :asc)
  end

end