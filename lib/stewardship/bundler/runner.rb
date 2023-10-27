require "open3" # This is a Ruby standard library.

module Stewardship
  module Bundler
    # The Runner module provides a command to run Bundler and check for outdated dependencies.
    module Runner
      extend self

      # Returns information about the specified gem.
      #
      # @param gem [String] the name of the gem to get information about
      # @return [String] the information about the gem
      def info(gem) = runner("bundle info #{gem}")[:stdout]

      # Returns a list of outdated dependencies.
      #
      # @return [String] the list of outdated dependencies
      def outdated = runner("bundle outdated --strict --only-explicit")[:stdout]

      def runner(cmd)
        stdout, stderr, exit_code = Open3.capture3(cmd)
        if exit_code != 0
          raise StandardError, "Command `#{cmd} failed with exit code #{exit_code}: #{stderr}"
        end
        {stdout:, stderr:}
      end
    end
  end
end
