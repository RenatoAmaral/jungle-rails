class Admin::ApplicationController < ApplicationController
  http_basic_authenticate_with :name => Rails.configuration.http_auth[:user], :password => Rails.configuration.http_auth[:pass]
end
