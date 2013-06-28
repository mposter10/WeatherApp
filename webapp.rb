# Every morning at 8am, send New York City weather report to subscribers.
# Use yahoo_weatherman to access http://weather.yahoo.com/united-states/new-york/new-york-2459115/
# Once accessed, send out alet message to a subscribed user.

require 'yahoo_weatherman'
require 'rubygems'
require 'twilio-ruby'

client = Weatherman::Client.new
response = client.lookup_by_woeid 2459115

response.location 
response.location 
response.condition 

celsius = response.condition["temp"]

farenheit = (((celsius*9)/5)+32)
puts "#{farenheit} degrees Farenheit"


# twilio-ruby install docs at twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'
# Get your Account Sid and Auth Token from twilio.com/user/account 
account_sid = 'AC4aac7e190d4a99cc6514cbffed0f412a'
auth_token = '062a9945b655b7cb7057c13bfeb1333f'
@client = Twilio::REST::Client.new account_sid, auth_token
 
message = @client.account.sms.messages.create(:body => "The weather this morning is #{farenheit} degrees Farenheit.",
    :to => "+19179029164",
    :from => "+19175254822")
puts message.sid