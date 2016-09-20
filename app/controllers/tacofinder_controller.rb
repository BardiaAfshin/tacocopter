class TacofinderController < ApplicationController
  def index
  	@tacos = Taco.all
  	@salsas = Salsa.all
  end

  def search
  	# TODO: implement permitted params
  	# query we want to achieve via active record
  	taco_list = params[:taco][:taco_name].map {|t| ActiveRecord::Base::sanitize(t) if t.length > 0 }.select{ |t| !t.nil? }.join(',')

  	salsa_list = salsa_list = params[:salsa][:salsa_name].map {|t| ActiveRecord::Base::sanitize(t) if t.length > 0 }.select{ |t| !t.nil? }.join(',')
  	

  	query = "SELECT distinct(stores.name) as store_name, cities.name as city_name from tacos, stores_tacos, stores, cities, stores_salsas, salsas "\
 				 "WHERE tacos.id = stores_tacos.store_id AND stores.id = stores_tacos.store_id AND cities.id = stores.city_id AND stores.id = stores_salsas.store_id AND stores_salsas.salsa_id = salsas.id "\
				  "AND LTRIM(RTRIM(tacos.name)) IN (" + taco_list +") " \
				  "AND LTRIM(RTRIM(salsas.name)) IN ("+ salsa_list +")"


	@results = ActiveRecord::Base.connection.execute(query)
  end
end
