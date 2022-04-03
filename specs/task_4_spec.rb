

RSpec.describe 'TaskFour' do
  let(:task) { TaskFour.new(currency: 'BTT', reference_crypto: 'AXS') }
  let(:result) { task.run }

  before do
    allow(CryptoClient).to receive(:new).and_return(double(get: [
      {
        'id' => 'BTT',
        'status' => 'active',
        'price' => '0.0041642670'
      },
      {
        'id' => 'AXS',
        'status' => 'dead',
        'price' => '0.000069194533'
      }
    ]))
  end

  it 'returns selected payload, given tickers' do
    expect(result).to eq(60.18202333990751)
  end
end
