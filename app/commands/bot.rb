require 'rest-client'
require 'json'

module Bafiambot
  module Commands
    class GetUserInfo < SlackRubyBot::Commands::Base
      command 'get_info' do |client, data, _match|
        output_2 = Users.new
        send = output_2.get_all_users_name
        client.say(channel: data.channel, text: send)
      end
    end

    class GetQuote < SlackRubyBot::Commands::Base
      match /start my day!!/ do |client, data, _match|
        output = Quotes.new
        send = output.obtain_quote
        client.say(channel: data.channel, text: send)
      end
    end
  end
end

class Users
  attr_accessor :output
  def initialize
    get_token = ENV['SLACK_API_TOKEN']
    url = "https://slack.com/api/users.list?token=#{get_token}"
    response = RestClient.get(url)
    @output = JSON.parse(response)
  end

  def get_all_users_name
    member = @output['members']
    i = 0
    user_names = []
    while i < member.length
      username = member[i]['name']
      email = member[i]['profile']['email']
      user_names.push("#{username} : #{email}") unless email.nil?
      i += 1
    end

    user_names
  end
end

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
