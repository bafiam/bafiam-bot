require 'rest-client'
require 'json'

class Quotes
  attr_accessor :output
  def initialize
    url = 'http://quotes.stormconsultancy.co.uk/random.json'
    response = RestClient.get(url)
    @output = JSON.parse(response)
  end

  def obtain_quote
    quote = @output['quote']
    author = @output['author']
    " #{quote} by #{author}"
  end
end
