require 'crypto_client'

class TaskFour
  attr_reader :currency, :reference_crypto

  def initialize(currency:, reference_crypto: 'BTC')
    @currency = currency
    @reference_crypto = reference_crypto
  end

  def run
    pair = CryptoClient.new('currencies/ticker', ids: ids).get

    price(pair.first) / price(pair.last)
  end

  private

  def ids
    [currency, reference_crypto].join(',')
  end

  def price(crypto)
    crypto.fetch('price').to_f
  end
end
