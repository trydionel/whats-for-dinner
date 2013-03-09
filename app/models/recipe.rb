class Recipe < ActiveRecord::Base
  attr_accessible :name, :description, :staple
  validates_presence_of :name
end
