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

  def events
    @day.events.order(starts_on: :asc)
  end

end