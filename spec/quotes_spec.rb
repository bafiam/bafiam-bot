require_relative '../app/lib/quotes.rb'
require_relative './quote_data.rb'
require 'json'

RSpec.describe Quotes do
  let(:run) { Quotes.new(JSON.parse(Testdata.run_data)) }

  describe '#initialize' do
    context 'When initialized' do
      it 'return string instance variable ' do
        run = Quotes.new(JSON.parse(Testdata.run_data))
        check_class = run.output.class
        expect(check_class).to eql Hash
      end
    end
  end
  describe '#obtain_quote' do
    context 'When data is passed' do
      it 'return a string' do
        expect(run.obtain_quote.class).to eql String
      end
    end
  end
end
