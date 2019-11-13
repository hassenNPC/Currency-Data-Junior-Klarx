require 'spec_helper'

set :environment , :test 

describe 'ExchangeApplication' do
#test the home page 
  it "should load the home page" do
    get '/'
    expect(last_response).to be_ok
  end
#test the history page
  it "should load the home page" do
    get '/history'
    expect(last_response).to be_ok
  end
  
#test the transaction 
  it "should load the home page" do
    get '/result?fromvalue=4444&from=USD&to=EUR'
    expect(last_response).to be_ok
  end


  # todo: Add more tests here

end