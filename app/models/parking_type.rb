# == Schema Information
#
# Table name: parking_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ParkingType < ActiveRecord::Base
end
