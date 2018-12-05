require 'spec_helper'

RSpec.describe Aparecium::DependencyFinder do
  subject { described_class.new(file) }

  describe '#dependencies' do
    context 'when there are no dependencies at all' do
      let(:file) { FixtureHelper::EMPTY_FIXTURE }

      specify do
        expect(subject.dependencies).to be_empty
      end
    end

    context 'when dependencies are explicitly empty' do
      let(:file) { FixtureHelper::EMPTY_DEPS_FIXTURE }

      specify do
        expect(subject.dependencies).to be_empty
      end
    end

    context 'when there are dependencies' do
      let(:file) { FixtureHelper::NONRECURSIVE_FIXTURE }

      it 'is all of the listed dependencies' do
        expect(subject.dependencies).to eq ['app5']
      end

      context 'when there is also other stuff in the file' do
        let(:file) { FixtureHelper::FIXTURE_WITH_OTHER_STUFF }

        it 'is all of the listed dependencies' do
          expect(subject.dependencies).to eq ['app5', 'app6']
        end
      end
    end
  end
end
