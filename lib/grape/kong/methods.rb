module Grape
  module Kong
    module Methods
      attr_accessor :resource_owner, :scopes
      alias_method :current_user, :resource_owner
    end
  end
end
