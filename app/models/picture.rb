# == Schema Information
#
# Table name: pictures
#
#  id                 :integer          not null, primary key
#  house_id           :integer
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#
# Indexes
#
#  index_pictures_on_house_id  (house_id)
#

class Picture < ActiveRecord::Base
  belongs_to :house
  has_attached_file :image,
  :styles => { :large => "500x500>", :medium => "300x300>", :thumb => "100x100>" },
  :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
