require 'grape/kong/configuration'

module Grape
  module Kong
    module Configurable

      def config
        @config ||= ::Grape::Kong::Configuration.new
      end

      def configure
        yield config if block_given?
      end

    end
  end
end
