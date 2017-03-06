class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def festival_id
  	params[:festival_id]
  end

  def festival
    #Festival.find(1)
  	Festival.find_by_url(request.domain(10).gsub(/^www./,""))
  end
  helper_method :festival

  def newsletter
    @newsletter = Newsletter.new
  end
  helper_method :newsletter

  def section
    controller_name
  end
  helper_method :section

  def widgets
    festival.widgets.all
  end
  helper_method :widgets

  before_filter :set_locale

  protected

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end


  #before_action :set_locale

  #def set_locale
  #  if cookies[:user_locale] && I18n.available_locales.include?(cookies[:user_locale].to_sym)
  #    l = cookies[:user_locale].to_sym
  #  else
  #    l = I18n.default_locale
  #    cookies.permanent[:user_locale] = l
  #  end
  #  I18n.locale = l
  #end

end
