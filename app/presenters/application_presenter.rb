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

  	def load_widgets
      render partial: 'shared/widgets'
  	end

    def contact_form
      render partial: 'shared/contact_form'
    end
end