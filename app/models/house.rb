# == Schema Information
#
# Table name: houses
#
#  id           :integer          not null, primary key
#  type_id      :integer
#  name         :string(255)
#  address      :string(255)
#  area         :integer
#  mainarea     :integer
#  piece        :integer
#  room         :integer
#  bathroom     :integer
#  toilette     :integer
#  price        :integer
#  energy       :integer
#  impact       :integer
#  tax          :integer
#  fee          :integer
#  charge       :integer
#  lot          :integer
#  heating      :string(255)
#  construction :integer
#  outdoorarea  :integer
#  floor        :integer
#  description  :text
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_houses_on_type_id  (type_id)
#

class House < ActiveRecord::Base
  belongs_to :type
  has_many :pictures, :dependent => :destroy
  accepts_nested_attributes_for :pictures, :allow_destroy => true
  validates :pictures, presence: true
  validates :type, presence: true
end
