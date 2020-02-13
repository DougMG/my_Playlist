require 'base64'
require 'rest-client'
require 'json'

class SpotifyService
  AUTHORIZE_URI = 'https://accounts.spotify.com/authorize'.freeze
  TOKEN_URI     = 'https://accounts.spotify.com/api/token'.freeze

  def initialize(client_id, client_secret)
    @client_id = client_id
    @client_secret = client_secret
  end

  def authenticate
    begin
      request_body = { grant_type: 'client_credentials' }
      response = RestClient.post(TOKEN_URI, request_body, auth_header)
      JSON.parse(response) ['access_token']  
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end

  private

  def auth_header
    authorization = Base64.strict_encode64("#{@client_id}:#{@client_secret}")
    { 'Authorization' => "Basic #{authorization}" }
  end
end