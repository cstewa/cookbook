class Recipe < ActiveRecord::Base
  attr_accessible :description, :title
  has_many :ingredients
  has_many :comments
  belongs_to :category
end
