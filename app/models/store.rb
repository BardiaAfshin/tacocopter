class Store < ActiveRecord::Base
	has_many :stores_salsa
	has_many :stores_taco
end
