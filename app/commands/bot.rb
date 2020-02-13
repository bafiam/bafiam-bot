# frozen_string_literal: true

require 'rest-client'
require 'json'

module Bafiambot
  module Commands
    
    class GetUserInfo < SlackRubyBot::Commands::Base
      command 'get_info' do |client, data, _match|
        output = Users.fetch_data
        send = Users.get_all_users_name(output)
        client.say(channel: data.channel, text: send)
      end
    end
    
    class GetQuote < SlackRubyBot::Commands::Base
      match /start my day!!/ do |client, data, _match|
        output = Quotes.fetch_quotes
        send = Quotes.obtain_quote(output)
        client.say(channel: data.channel, text: send)
      end
    end
  end
end


class Users
  def self.fetch_data
    get_token = ENV['SLACK_API_TOKEN']
    url = "https://slack.com/api/users.list?token=#{get_token}"
    response = RestClient.get(url)
    output = JSON.parse(response)
    output
  end

  def self.get_all_users_name(data)
    members = data['members']
    i = 0
    user_names = []
    while i < members.length
      username = members[i]['name']
      email = members[i]['profile']['email']
      user_names.push("#{username} : #{email}") unless email.nil?
      i += 1
    end

    user_names
  end
end


class Quotes
  def self.fetch_quotes
    url = 'http://quotes.stormconsultancy.co.uk/random.json'
    response = RestClient.get(url)
    output = JSON.parse(response)
    output
  end

  def self.obtain_quote(data)
    quote = data['quote']
    author = data['author']
    " #{quote} by #{author}"
  end
end
