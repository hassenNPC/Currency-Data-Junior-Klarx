# this is a simple model example
# check https://datamapper.org/getting-started.html
class ExchangeCoin
	#include the data mapper thus he can map all the variables with columns in database
	include DataMapper::Resource

	property :id,         Serial    # An auto-increment integer key
	property :fromcoin,   String   # A varchar type string, for short strings
	property :tocoin ,   String
	property :value , Integer 
	property :result, Float
end



# we call this when we have defined all your models
DataMapper.finalize

# automatically create the post table
ExchangeCoin.auto_upgrade!