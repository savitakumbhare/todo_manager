class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |user| user.to_user_list }.join("\n")
  end

  def show
    id = params[:id]
    todo = User.find(id)
    render plain: user.to_pleasant_string
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,
    )
    response_text = "Hey, your new User is created with id #{new_user.id}"
    render plain: response_text
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email, password: password)
    if user.id
      found = true
    else
      found = false
    end
    render plain: found
  end
end
