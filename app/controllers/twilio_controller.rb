require 'twilio-ruby'
class TwilioController < ApplicationController
  include Webhookable
 
  after_filter :set_header
  
  skip_before_action :verify_authenticity_token
 
  def text
    response = Twilio::TwiML::Response.new do |r|
	hi = "test response"
	body = request.body.read.split("Body=")[1].split("&FromCountry")[0]
	 if User.find_by(id: body) == nil
		info = "Please send a correct code. The last code you sent was " + body
	  else
		info = User.find_by(id: body).microposts.shuffle.first.content
	  end
	
	r.message info
	end
    render_twiml response
  end
 end
