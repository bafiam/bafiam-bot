require './spec/spec_helper.rb'

describe Bafiambot::Bot do
  def app
    Bafiambot::Bot.instance
  end

  subject { app }

  it_behaves_like 'a slack ruby bot'
end
