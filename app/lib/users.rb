require 'rest-client'
require 'json'

class Users
  attr_accessor :output
  def initialize(output = Hash.new())
    @output = output
  end

  def all_users_name
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
