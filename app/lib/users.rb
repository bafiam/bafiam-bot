require 'rest-client'
require 'json'

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
