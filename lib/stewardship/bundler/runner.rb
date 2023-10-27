module Stewardship
  module Bundler
    # The Runner module provides a command to run Bundler and check for outdated dependencies.
    module Runner
      extend self

      # Returns information about the specified gem.
      #
      # @param gem [String] the name of the gem to get information about
      # @return [String] the information about the gem
      def info(gem) = `bundle info #{gem}`

      # Returns a list of outdated dependencies.
      #
      # @return [String] the list of outdated dependencies
      def outdated = `bundle outdated --strict --only-explicit`
    end
  end
end
