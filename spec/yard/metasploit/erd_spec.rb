RSpec.describe YARD::Metasploit::ERD do
  context 'CONSTANTS' do
    context 'VERSION' do
      subject(:version) do
        described_class::VERSION
      end

      it 'is YARD::Metasploit::ERD::Version.full' do
        expect(version).to eq(YARD::Metasploit::ERD::Version.full)
      end
    end
  end
end