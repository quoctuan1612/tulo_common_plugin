# frozen_string_literal: true

module TuloCommon
  module ErrorHandler
    class BaseHandler
      include Gruf::Errors::Helpers
      attr_reader :error, :request

      def initialize(request, exception)
        @error = Gruf::Error.new
        @request = request
        @exception = exception
      end

      def handled?
        true
      end

      def custom_fail!(error_code, message)
        fail!(error_code, :custom, message)
      end

      def add_custom_field_error(field, message)
        add_field_error(field, :custom, message)
      end
    end
  end
end
