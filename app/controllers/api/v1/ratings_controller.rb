module Api
  module V1
    class RatingsController < ApplicationController
      before_action :authenticate, only: %i[create update]
      before_action :load_rating, only: %i[show update]

      def show
        if @rating
          render json: serialize(@rating)
        else
          render json: {}, status: :not_found
        end
      end

      def create
        sender = Sender.find_or_initialize_by(uid: rating_attrs[:sender])
        receiver = Receiver.find_or_initialize_by(uid: rating_attrs[:receiver])

        rating = Rating.new(
          api_user: auth_user,
          sender: sender,
          receiver: receiver,
          value: rating_attrs[:value]
        )

        if rating.save
          render json: serialize(rating), status: :created
        else
          respond_with_errors(rating)
        end
      end

      def update
        if @rating && @rating.api_user == auth_user
          @rating.modify!(rating_attrs[:value])
          render json: serialize(@rating), status: :ok
        else
          render json: {}, status: :not_found
        end
      end

      private

      def load_rating
        @rating = Rating.find_by(uid: params[:id])
      end

      def serialize(rating)
        RatingSerializer.new(rating).serialized_json
      end

      def rating_params
        params.require(:data).permit(:type,
                                     attributes: %i[sender receiver value])
      end

      def rating_attrs
        rating_params[:attributes] || {}
      end
    end
  end
end
