class Ingredient < ActiveRecord::Base
  attr_accessible :name, :quantity
  belongs_to :recipe
end
