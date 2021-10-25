# frozen_string_literal: true

module TuloCommon
  module RequestHandler
    module JwtHandler
      def jwt
        @jwt ||= begin
          return nil if auth_header.nil?

          token = auth_header.gsub('Bearer ', '')
          (JWT.decode token, nil, false).first
        end
      end
    end
  end
end
