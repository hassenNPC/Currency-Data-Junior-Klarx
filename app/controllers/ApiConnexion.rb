require 'money/bank/currencylayer_bank'

class ApiConnexion
  
	api = Money::Bank::CurrencylayerBank.new
	api.access_key = '71864eb9323a72df9e95aef21638afab'


	Money.default_bank = api  

	#change from dollar to any currency

	def self.FromUsd(val,coin)

		res = val*Money.new(100, 'USD').exchange_to(coin).to_f
    	return res
  	end
	
	#change from any currency to dollar

  	def self.ToUsd(val,coin)
    	res = val *(1/Money.new(100, 'USD').exchange_to(coin).to_f)
    	return res
  	end

  	#change from any currency to any currency 
  	def self.CoinToCoin(from,to,val)
  		dollar=self.ToUsd(val,from)
  		result=self.FromUsd(dollar,to)
  		return result 
  	end	 
end


class String
  def numeric?
    Float(self) != nil rescue false
  end
end