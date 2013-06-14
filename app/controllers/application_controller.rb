class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :setup_twilio_client

	def current_user
   if session[:user_id]
      @current_user = User.find(session[:user_id])
   end
  end
  
  helper_method :current_user

  def setup_twilio_client
  	if @twilio_client.nil?
  		@twilio_client = Twilio::REST::Client.new(
        "AC7d00170bd2a46c9161dbe4a70e092b78",
        "faa5fdfdf8d3233ae284d6e6e8a5b40e"
      )
    end
  end

end
