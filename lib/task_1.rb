require 'crypto_client'

class TaskOne
  attr_reader :tickers

  def initialize(tickers = [])
    @tickers = tickers
  end

  def run
    CryptoClient
      .new('currencies/ticker', ids: tickers.join(','))
      .get
  end
end
