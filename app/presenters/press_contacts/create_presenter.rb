class PressContacts::CreatePresenter < ApplicationPresenter
  def page_title
    content_for :title, festival.name + ' - Contact'
  end
end