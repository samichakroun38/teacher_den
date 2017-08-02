class User::UserController < ApplicationController
  before_action :authenticate_any!
end
