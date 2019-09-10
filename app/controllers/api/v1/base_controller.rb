module Api
  module V1
    class BaseController < ActionController::Base
      before_action :authenticate
      before_action :force_json_format

      private

      def api_key
         header = request.headers['Authorization']
         if header && header.match(/\ABearer /)
           header.gsub(/\ABearer /, '')
         else
           ''
         end
       end

      def authenticate
        if api_key != Rails.application.credentials[:api_key]
          render json: { status: 'Not authorized' }, status: 401
        end
      end

      def force_json_format
        request.format = 'json'
      end
    end
  end
end
