class StoresSalsa < ActiveRecord::Base
	# usage StoresSalsa.count
	belongs_to :store
	has_one :salsa, foreign_key: 'id'
	has_many :stores_tacos, :through => :store

	self.table_name = 'stores_salsas'
end
