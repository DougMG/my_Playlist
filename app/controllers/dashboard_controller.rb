require 'rest-client'
require 'json'

class DashboardController < ApplicationController
  API_URI = 'https://api.spotify.com/v1/'

  def index
    client_id = 'f8bb4c4ca2e54deeb74bacc01ab29447'
    client_secret = 'd2be6554d42a40b99c7a382aa8503545'
    client_token = SpotifyService.new(client_id, client_secret).authenticate
    res =  RestClient.get(API_URI << "users/214pu6ykggbhs43ehtifns6xy/playlists", { 'Content-Type' => 'aplication/json', 'Authorization' => "Bearer #{client_token}" })
    playlist_response = JSON.parse(res.body)
    @playlists = playlist_response["items"]
  end
end
