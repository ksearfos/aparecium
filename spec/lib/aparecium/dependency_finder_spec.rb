require 'spec_helper'

RSpec.describe Aparecium::DependencyFinder do
  subject { described_class.new(contents.to_yaml) }

  describe '#dependencies' do
    context 'when there are no dependencies' do
      let(:contents) { '' }

      specify do
        expect(subject.dependencies).to be_empty
      end
    end

    context 'when dependencies are explicitly empty' do
      let(:contents) { Hash dependencies: [] }

      specify do
        expect(subject.dependencies).to be_empty
      end
    end

    context 'when there are dependencies' do
      let(:contents) { Hash dependencies: deps }
      let(:deps) { %w(app1 app2) }

      it 'is all of the listed dependencies' do
        expect(subject.dependencies).to eq deps
      end

      context 'when there is also other stuff in the file' do
        let(:contents) do
          {
            thing1: 'something',
            dependencies: deps,
            thing2: 'something else'
          }
        end

        it 'is all of the listed dependencies' do
          expect(subject.dependencies).to eq deps
        end
      end
    end
  end
end
