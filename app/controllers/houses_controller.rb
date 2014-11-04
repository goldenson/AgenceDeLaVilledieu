class HousesController < InheritedResources::Base
	def index
		@houses = House.order("created_at desc")
	end

	def show
		@house = House.find(params[:id])
	end
end