class PagesController < InheritedResources::Base
	def home
		@houses = House.order("created_at desc").limit(8)
	end
	def contact
	end
end