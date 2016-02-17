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

end