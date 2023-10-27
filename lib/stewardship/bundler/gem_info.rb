module Stewardship
  module Bundler
    # This class represents information about a gem.
    class GemInfo
      include Memery

      attr_reader :gem_name

      # Initializes a new instance of GemInfo with the given gem name.
      #
      # @param gem_name [String] the name of the gem
      def initialize(gem_name, runner: Runner)
        @gem_name = gem_name
        @runner = runner
      end

      # Returns a hash containing information about the gem.
      #
      # @return [Hash] a hash containing information about the gem
      memoize def info
        @runner.info(gem_name).split("\n").map(&:strip).then do |rows|
          rows.map do |row|
            row.split(": ", 2)
          end.keep_if { _1.length == 2 }.to_h
        end
      end

      # Returns the summary of the gem.
      #
      # @return [String] the summary of the gem
      memoize def summary = info["Summary"]

      # Returns the homepage of the gem.
      #
      # @return [String] the homepage of the gem
      memoize def homepage = info["Homepage"]

      # Returns the source code URI of the gem.
      #
      # @return [String] the source code URI of the gem
      memoize def source_code_uri = info["Source Code"]

      # Returns the bug tracker URI of the gem.
      #
      # @return [String] the bug tracker URI of the gem
      memoize def bug_tracker_uri = info["Bug Tracker"]

      # Returns the changelog of the gem.
      #
      # @return [String] the changelog of the gem
      memoize def changelog = info["Changelog"]

      # Returns the wiki of the gem.
      #
      # @return [String] the wiki of the gem
      memoize def wiki = info["Wiki"]

      # Returns the path of the gem.
      #
      # @return [String] the path of the gem
      memoize def path = info["Path"]
    end
  end
end
