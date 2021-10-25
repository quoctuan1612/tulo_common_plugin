# frozen_string_literal: true

module TuloCommon
  module RequestHandler
    module AuthGrpcHeaderHandler
      def auth_header
        @auth_header ||= (request.metadata['authorization'] || request.metadata[:authorization])
      end
    end
  end
end
