class ChatController < ApplicationController

  def send(one, two)
		#debugger

		#		Juggernaut.redis_options[:host] = "d650.ath.cx"
 		@msg				= params[:msg_body]
		@sender			= params[:sender]
		@recipient	= params[:recipient] 
		
		#TODO				: implement recipient filed in the form
		#						: allow users to chat by clicking on link on wall

		Juggernaut.publish( "/chat/#{@recipient}", parse_chat_msg(@msg,@sender) )

		respond_to do |format|
			format.js
		end 
  end

	def parse_chat_msg(msg,sender)
		return "#{sender}: #{msg}"
	end

	def setup
		#Juggernaut.redis_options[:host] = "d650.ath.cx"
		
	end 

end
