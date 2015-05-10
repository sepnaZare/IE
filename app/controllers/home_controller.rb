class HomeController < ApplicationController
	def index
		@items = Item.search(params[:search]) if params[:search].present?
    	@items = Item.all if not params[:search].present?
    	@stores = Store.search(params[:search]) if params[:search].present?
    	@stores = Store.all if not params[:search].present?
	end
end
