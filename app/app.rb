# frozen_string_literal: true

module Bafiambot
  class Bot < SlackRubyBot::Bot
    help do
      title 'Bafiam Bot'
      desc 'A bot to get workspace users info and motivation quotes'

      command :get_info do
        title 'get_info'
        desc 'return workspace members name and email'
      end
    end
  end
end
