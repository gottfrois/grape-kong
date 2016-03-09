require 'grape/kong/methods'

module Grape
  module Kong
    class Authenticable < Grape::Middleware::Base

      def context
        env['api.endpoint']
      end

      def before
        authenticate!
        context.extend Grape::Kong::Methods
        context.resource_owner = resource_owner
        context.scopes = scopes
      end

      private

      def authenticate!
        fail Grape::Kong::ForbiddenError unless resource_owner_id
        fail Grape::Kong::ForbiddenError unless resource_owner
      end

      def resource_owner
        @resource_owner ||= Grape::Kong.config.resource_owner_finder.call(resource_owner_id)
      end

      # logged-in user ID who has granted permission to the client
      def resource_owner_id
        env['X-Authenticated-Userid']
      end

      # TODO
      # comma-separated list of scopes that the end user has authenticated (if available)
      # def scopes
      #   env['X-Authenticated-Scope']
      # end

    end
  end
end
