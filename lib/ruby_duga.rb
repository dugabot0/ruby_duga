# frozen_string_literal: true

require_relative "ruby_duga/version"
require_relative "ruby_duga/client"

module RubyDuga
  class Error < StandardError; end

  def self.new(options = {})
    RubyDuga::Client.new(options)
  end
end
