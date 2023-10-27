RSpec.describe Stewardship::Bundler::Parser do
  let(:input) { File.read File.expand_path(File.join(__FILE__, "..", "..", "..", "..", "fixtures", "bundle-outdated")) }
  subject(:parser) { described_class.new(input) }

  describe "#to_h" do
    subject(:to_h) { parser.to_h }

    it { is_expected.to be_an Array }
    its(:length) { should eq 18 }

    context "a random sampling (rspec-mocks)" do
      subject { to_h[9] }

      it { should include gem: "rspec-mocks" }
      it { should include latest: "3.12.6" }
      it { should include current: "3.12.5" }
      it { should include requested: nil }
      it { should include groups: nil }
    end

    context "a random sampling (standard)" do
      subject { to_h[14] }

      it { should include gem: "standard" }
      it { should include latest: "1.31.2" }
      it { should include current: "1.28.0" }
      it { should include requested: "~> 1.28" }
      it { should include groups: "development" }
    end
  end
end
