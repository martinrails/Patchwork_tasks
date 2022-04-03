require 'crypto_client'

class TaskThree
  attr_reader :currency, :reference_fiat

  def initialize(currency:, reference_fiat:)
    @currency = currency
    @reference_fiat = reference_fiat
  end

  def run
    query_params = {
      ids: currency,
      'quote-currency': reference_fiat
    }

    CryptoClient
      .new('currencies/ticker', query_params)
      .get
      .dig(0, 'price')
      .to_f
  end
end
