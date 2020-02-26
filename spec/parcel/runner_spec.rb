RSpec.describe Parcel::Runner do
  context 'with config' do
    describe 'compile' do
      it 'compiles all given assets' do
        described_class.clobber
        described_class.build
        expect(File.exist?(Parcel::Configuration.out_path.join('index.js'))).to eq true
      end
    end
  end
end
