require 'rest-client'
require 'json'

class Quotes
  attr_accessor :output_1
  def initialize
    url = 'http://quotes.stormconsultancy.co.uk/random.json'
    response = RestClient.get(url)
    @output_1 = JSON.parse(response)
  end

  def obtain_quote
    quote = @output_1['quote']
    author = @output_1['author']
    " #{quote} by #{author}"
  end
end
