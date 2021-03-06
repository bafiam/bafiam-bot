require 'rest-client'
require 'json'
require_relative '../lib/users.rb'
require_relative '../lib/quotes.rb'

module Bafiambot
  module Commands
    class GetUserInfo < SlackRubyBot::Commands::Base
      command 'get_info' do |client, data, _match|
        get_token = ENV['SLACK_API_TOKEN']
        url = "https://slack.com/api/users.list?token=#{get_token}"
        response = RestClient.get(url)
        output = JSON.parse(response)
        run = Users.new(output)
        send = run.all_users_name
        client.say(channel: data.channel, text: send)
      end
    end

    class GetQuote < SlackRubyBot::Commands::Base
      match(/start my day!!/) do |client, data, _match|
        url = 'http://quotes.stormconsultancy.co.uk/random.json'
        response = RestClient.get(url)
        output = Quotes.new(JSON.parse(response))
        send = output.obtain_quote
        client.say(channel: data.channel, text: send)
      end
    end
  end
end
