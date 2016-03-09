module Grape
  module Kong
    class Configuration

      attr_accessor :resource_owner_finder

      def initialize
        @resource_owner_finder = ->(value) { ::User.where(id: value).first }
      end

    end
  end
end
