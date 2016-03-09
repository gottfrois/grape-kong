module Grape
  module Kong
    Exceptions = Class.new(StandardError)
    ForbiddenError = Class.new(Exceptions)
  end
end
