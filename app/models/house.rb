class House < ActiveRecord::Base
  belongs_to :type
  has_many :pictures, :dependent => :destroy
  accepts_nested_attributes_for :pictures, :allow_destroy => true
end
