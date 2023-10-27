module Stewardship
  module Bundler
    # The Parser class provides functionality for parsing Bundler output.
    class Parser
      include Memery

      # Initializes a new instance of the Parser class.
      #
      # @param input [String] The input to parse.
      def initialize(input)
        @input = input
      end

      # Returns a hash representation of the parsed input.
      # The keys of the hash are the column names.
      #
      # @example { gem: "gem_name", latest: "1.0.0", installed: "0.1.0", requested: ">= 0.1.0", groups: "default", homepage: "" }
      #
      # @return [Hash] A hash representation of the parsed input.
      memoize def to_h
        data_rows.map do |row|
          column_reference.each_with_object({}) do |column, hash|
            hash[column[:column_name]] = row[column[:start]..column[:stop]]&.strip
          end
        end
      end

      private

      memoize def column_reference
        start = 0
        column_names.each_with_index.map do |column_name, index|
          stop =
            if index == column_names.length - 1
              -1
            else
              start + column_widths[index] - 1
            end
          {column_name:, start:, stop:}.tap do
            start = start + column_widths[index]
          end
        end
      end

      memoize def column_widths = input.first.scan(/\w+\s*/).map(&:length)

      memoize def column_names = input.first.split.map(&:strip).map(&:downcase).map(&:to_sym)

      memoize def data_rows = input[1..]

      memoize def input = @input.split("\n")
    end
  end
end
