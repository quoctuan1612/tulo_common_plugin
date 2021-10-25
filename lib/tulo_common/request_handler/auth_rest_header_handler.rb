# frozen_string_literal: true

module TuloCommon
  module RequestHandler
    module AuthRestHeaderHandler
      def auth_header
        @auth_header ||= request.headers[:Authorization]
      end
    end
  end
end
