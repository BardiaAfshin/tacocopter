class TacofinderController < ApplicationController
  def index
  	@tacos = Taco.all
  	@taco = Taco.new

  	@salsas = Salsa.all
  end

  def search
  end
end
