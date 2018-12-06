require 'spec_helper'

RSpec.describe Aparecium do
  subject { described_class.new(file) }

  describe '#all_dependencies' do
    context 'when there are no dependencies' do
      let(:file) { FixtureHelper::EMPTY_FIXTURE }

      specify do
        expect(subject.all_dependencies).to be_empty
      end
    end

    context 'when there is only one set of dependencies' do
      let(:file) { FixtureHelper::NONRECURSIVE_FIXTURE }

      it "is all of the app's dependencies" do
        expect(subject.all_dependencies).to eq FixtureHelper::NONRECURSIVE_DEPS
      end
    end

    context 'when the depdencies also have dependencies' do
      let(:file) { FixtureHelper::DEPS_WITH_DEPS_FIXTURE }

      it "is all of the app's dependencies, and their dependencies" do
        expect(subject.all_dependencies).to eq FixtureHelper::DEPS_WITH_DEPS
      end
    end

    context 'when the depdencies are recursive' do
      let(:file) { FixtureHelper::FIXTURE_WITH_ALL_DEPS }

      it "only checks a dependency once" do
        expect(subject.all_dependencies).to match_array FixtureHelper::ALL_DEPS
      end
    end
  end
end
