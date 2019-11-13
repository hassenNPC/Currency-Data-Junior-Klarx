# For the documentation check http://sinatrarb.com/intro.html


class ApplicationController < Sinatra::Base
	# This configuration part will inform the app where to search for the views and from where it will serve the static files
 	


 	

	
  	configure do
    	set :views, "app/views"
    	set :public_dir, "app/public"
    	
  	end
  	#get history of transactions from data base 
  	get '/result' do
  		#not valid value
  		if not params[:FromValue].numeric? 
  			@caution="Please type a valid value"
  			


  		else
  			#valid value
  			#extract values from params
  			from=params[:From]
  			puts from 
  			to=params[:To]
  			value=params[:FromValue].to_i
  			
  			#convert the value using the api 
  			val=ApiConnexion.CoinToCoin(from,to,value)
  				
  			#create a transaction from the model
  			transaction=ExchangeCoin.new 
  			#fill the model
  			transaction.fromcoin=from
  			transaction.tocoin=to
  			transaction.result=val
  			transaction.value=value
  			#save the transaction to database
  			transaction.save
  			#pass the result to the view
			@result=val.to_s
			@message ="The result of your exchange is : "
		end		
   		erb :index 

  	end

  	get '/' do
  		
   		erb :index 
  	end





  	get '/history' do
  		

  		
   		@exchanges= ExchangeCoin.all
   		erb :history

  		 
  	end


end

