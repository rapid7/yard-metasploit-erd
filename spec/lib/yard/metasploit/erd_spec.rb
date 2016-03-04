RSpec.describe YARD::Metasploit::ERD do
  context 'CONSTANTS' do
    context 'VERSION' do
      subject(:version) {
        described_class::VERSION
      }

      it 'is Metasploit::ERD::Version.full' do
        expect(version).to eq(YARD::Metasploit::ERD::VERSION)
      end
    end
  end
end
