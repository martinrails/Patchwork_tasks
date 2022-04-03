

RSpec.describe 'TaskThree' do
  let(:task) { TaskThree.new(currency: 'BTT', reference_fiat: 'EUR') }
  let(:result) { task.run }

  before do
    allow(CryptoClient).to receive(:new).and_return(double(get: [
      {
        'id' => 'BTT',
        'status' => 'active',
        'price' => '0.0041642670'
      }
    ]))
  end

  it 'returns selected payload, given tickers' do
    expect(result).to eq(0.0041642670)
  end
end
