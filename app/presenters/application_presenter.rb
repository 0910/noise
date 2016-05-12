class ApplicationPresenter < Curly::Presenter

	def t(key)
		translate(key)
	end
	
	def navigation
		  render partial: 'shared/navigation'
  	end

  	def footer
		  render partial: 'shared/footer'
  	end

  	def newsletter
		  render partial: 'shared/newsletter'
  	end

  	def player
		  render partial: 'shared/player'
  	end

    def contact_form
      render partial: 'shared/contact_form'
    end

    def press_contact_form
      render partial: 'shared/press_contact_form'
    end

    def menu_title_home
      festival.menu_title_home
    end

    def menu_title_artists
      festival.menu_title_artists
    end

    def menu_title_events
      festival.menu_title_events
    end

    def menu_title_news
      festival.menu_title_news
    end

    def menu_title_videos
      festival.menu_title_videos
    end

    def menu_title_venues
      festival.menu_title_venues
    end

    def menu_title_contacts
      festival.menu_title_contacts
    end
end