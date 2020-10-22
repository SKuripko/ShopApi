module Api
	class ShopsController < ApplicationController
		def index			
			result = ShopsPresenter.new(ShopsQuery.new(params).fetch_shops).as_json

			render json: {shops: result }
		end
	end
end