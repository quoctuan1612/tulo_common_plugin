# frozen_string_literal: true

module TuloCommon
  module ErrorHandler
    class InvalidRequestParamsHandler < ErrorHandler::BaseHandler
      def run!
        @exception.errors.messages.each do |field, messages|
          messages.each do |message|
            add_custom_field_error(field, message)
          end
        end
        custom_fail!(:invalid_argument, 'Please correct your errors.')
      end
    end
  end
end
