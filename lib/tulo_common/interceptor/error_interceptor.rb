# frozen_string_literal: true

module TuloCommon
  module Interceptor
    class ErrorInterceptor < ::Gruf::Interceptors::ServerInterceptor
      def render_exception!(exception)
        handler = ::ErrorHandler.handle_exception(request, exception)
        # Handlerを用意していない例外なので、そのままraiseする
        raise exception if handler.nil?

        handler.run!
      end

      def call
        yield
      rescue StandardError => e
        render_exception!(e)
      end
    end
  end
end
