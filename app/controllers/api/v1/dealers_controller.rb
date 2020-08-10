module Api
  module V1
    class DealersController < ApplicationController
      def index
        @dealers = Dealer.paginate(page: params[:page], per_page: 30)
        render json: @dealers
      end
    end
  end
end

