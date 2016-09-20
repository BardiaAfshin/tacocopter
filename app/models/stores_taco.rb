class StoresTaco < ActiveRecord::Base
	belongs_to :store
	has_many :taco
	has_many :stores_salsa, :through => :store
end