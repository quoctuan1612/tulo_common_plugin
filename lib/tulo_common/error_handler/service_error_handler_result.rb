# frozen_string_literal: true

module TuloCommon
  module ErrorHandler
    class ServiceErrorHandlerResult
      attr_reader :handler

      def initialize(handler = nil)
        @handler = handler
      end

      def handled?
        @handler&.handled? || false
      end
    end
  end
end
