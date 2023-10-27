RSpec.describe Stewardship::Bundler::Runner do
  let(:expected_output) { "some output" }

  describe ".info" do
    it "returns information about the specified gem" do
      gem_name = "rails"
      expect(described_class).to receive(:runner).with("bundle info #{gem_name}").and_return(stdout: expected_output)
      expect(described_class.info(gem_name)).to eq(expected_output)
    end
  end

  describe ".outdated" do
    it "returns a list of outdated dependencies" do
      expect(described_class).to receive(:runner).with("bundle outdated --strict --only-explicit").and_return(stdout: expected_output)
      expect(described_class.outdated).to eq(expected_output)
    end
  end
end
