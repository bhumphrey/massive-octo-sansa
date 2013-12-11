require File.expand_path '../spec_helper.rb', __FILE__

describe "omniauth_example-sinatra" do
  it 'should load the home page' do
    get '/'

    last_response.should be_ok
  end
end