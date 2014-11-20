# == Schema Information
#
# Table name: houses
#
#  id           :integer          not null, primary key
#  type_id      :integer
#  name         :string(255)
#  address      :string(255)
#  area         :decimal(, )
#  mainarea     :integer
#  piece        :integer
#  room         :integer
#  bathroom     :integer
#  toilette     :integer
#  price        :integer
#  energy       :integer
#  impact       :integer
#  tax          :integer
#  fee          :decimal(, )
#  charge       :integer
#  lot          :integer
#  heating      :string(255)
#  construction :integer
#  outdoorarea  :integer
#  floor        :integer
#  description  :text
#  created_at   :datetime
#  updated_at   :datetime
#  proprio      :string(255)
#  slug         :string(255)
#  water        :string(255)
#
# Indexes
#
#  index_houses_on_slug     (slug) UNIQUE
#  index_houses_on_type_id  (type_id)
#

class House < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :type
  has_many :pictures, :dependent => :destroy
  accepts_nested_attributes_for :pictures, :allow_destroy => true
  validates :pictures, presence: true
  validates :type, presence: true
  validates :description, length: { minimum: 120 }

  def should_generate_new_friendly_id?
  	name_changed? || super
  end

end
