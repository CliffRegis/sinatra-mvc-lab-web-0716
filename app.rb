require_relative 'config/environment'

class App < Sinatra::Base


	get '/' do
		erb :user_input
	end

	post '/piglatinize' do

	@sent_word = PigLatinizer.new.piglatinize(params[:user_phrase])

		erb :pig_result
	end

end