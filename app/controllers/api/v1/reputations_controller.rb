module Api
  module V1
    class ReputationsController < ApplicationController
      def show
        receiver = Receiver.find_by(uid: params[:id])
        if receiver
          render json: ReputationSerializer.new(receiver).serialized_json
        else
          render json: {}, status: :not_found
        end
      end
    end
  end
end
