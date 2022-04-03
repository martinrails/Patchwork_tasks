require 'crypto_client'

class TaskTwo
  attr_reader :tickers, :fields

  def initialize(tickers = [], fields = [])
    @tickers = tickers
    @fields = fields
  end

  def run
    CryptoClient
      .new('currencies/ticker', ids: tickers.join(','))
      .get
      .map { |crypto| crypto.slice(*fields) }
  end
end
