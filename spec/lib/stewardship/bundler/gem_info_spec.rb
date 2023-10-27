RSpec.describe Stewardship::Bundler::GemInfo do
  let(:runner) { class_double(Stewardship::Bundler::Runner, info: nil) }
  let(:gem_info_output) { read_fixture_file("bundle-info") }
  let(:gem_name) { "standard" }

  subject(:gem_info) { described_class.new(gem_name) }

  before do
    allow(runner).to receive(:info).with(gem_name).and_return(gem_info_output)
  end

  its(:info) { should be_a Hash }
  its(:summary) { should eq "Ruby Style Guide, with linter & automatic code fixer" }
  its(:homepage) { should eq "https://github.com/standardrb/standard" }
  its(:source_code_uri) { should eq("https://github.com/standardrb/standard") }
  its(:bug_tracker_uri) { should be_nil }
  its(:changelog) { should eq("https://github.com/standardrb/standard/blob/main/CHANGELOG.md") }
  its(:wiki) { should be_nil }
  its(:path) { should match(/gems\/standard-1\.31\.2/) }
end
