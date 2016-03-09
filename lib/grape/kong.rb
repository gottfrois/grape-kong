require 'grape'
require 'grape/kong/version'
require 'grape/kong/exceptions'
require 'grape/kong/configurable'
require 'grape/kong/authenticable'

module Grape
  module Kong
    extend Configurable
  end
end
