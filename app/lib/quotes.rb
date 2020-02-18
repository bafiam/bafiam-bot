require 'rest-client'
require 'json'

class Quotes
  attr_reader :output
  def initialize(output)
    @output = output
  end

  def obtain_quote
    quote = @output['quote']
    author = @output['author']
    " #{quote} by #{author}"
  end
end
