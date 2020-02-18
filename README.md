# Slack Bot - Capstone Projects

The bafiam bot is technically a small tweek that bring efficiency to any slack workspace. As a developer, i find myself, in need of crucial members infomation. The only way to access this infomation is to go through the entire members list. For example, in the case where i have a members email, am forced to almost check each and every member profile and compare their email with the one i have.This is tiring work. On other days, i need a motivation quote to think about and start my day with. The solution to that is to search for one on the net.
The bafiam bot using a single command:

1. One is able to get a list of all members; all arranged in a list starting with their name and email.
2. Get a random quote to start your day

## Prerequisites

The development environment uses `Ruby`, hence install ruby before proceeding.

- Mac OS - `brew install ruby`

- Linux - `sudo apt-get install ruby-full`

- windows - Download RubyInstaller [here](https://rubyinstaller.org/), run it, and you are done!

## Installation and set-up

1. Clone the project - git clone`https://github.com/bafiam/bafiam-bot.git`

2. Run `bundle` to get all the gems.

3. create a `.env` file

4. Create a Slack Bot using this link - `http://slack.com/services/new/bot`

5. Add the token from the new created bot to the `.env`

   - SLACK_API_TOKEN=`token_from_slack_api`

## Run the server

1. Run `rackup` to start the bot

2. Navigate to the slack workspace

3. On one of the channels, invite the bot

## Commands

1. `get_info`==> Return a list of usernames and their corresponding emails

2. `help` ==> Returns a detailed overview description of the bot and commands to use

3. `start my day!!`[typing command] ==> returns a random quote

## Testing

The tests have been implemented using `RSpec`support from `slack-ruby-bot`
To run: Type
`rspec`
on your Terminal to get a report.

## Testing the endpoints

The Bot has been tested using two methodoligies

1. Unit testing ==> Create a test for the bot application itself

2. Simulation testing ==> Running the bot on slack and evaluating the output

## Built With

This project was developed using:

- slack-ruby-bot ==> Slack framework that does most of the heavy lifting

- celluloid-io ==> Acts as a server;allowing for concurrent processing

- dotenv ==> Enable us to load and run the bot from the config as well as load the enviroment variables

- rest-client ==> A simple HTTP and REST client to enable us process the url and get the data needed.

- rspec ==> For unit testing though in our case, we will be utilising the rspec from the slack-ruby-box and integratig them into our bot.

## Contact

Stephen Gumba - [Github profile](https://github.com/bafiam)
