class HousesController < InheritedResources::Base

	def index
		@house = House.order("created_at desc")
	end

	def show
		@house = House.friendly.find(params[:id])
	end


	private

	 def set_house
	 	@house = House.friendly.find(params[:id])
	 end 
end