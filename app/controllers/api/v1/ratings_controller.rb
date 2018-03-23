module Api
  module V1
    class RatingsController < ApplicationController
      def show
        @rating = Rating.find_by(uid: params[:uid])
        if @rating
          render @rating
        else
          render json: {}, status: :not_found
        end
      end
    end
  end
end
