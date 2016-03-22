class NewslettersController < ApplicationController
  def new
  	@festival = festival
    @newsletter = @festival.newsletters.new
  end
  def create
  	@festival = festival
    @newsletter = @festival.newsletters.create(newsletter_params)
    if @newsletter.save
      redirect_to root_path, notice: t('.successful')
    end
  end
  def newsletter_params
    params.require(:newsletter).permit(:email, :section)
  end
end