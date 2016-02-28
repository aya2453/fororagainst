class UsersController < ApplicationController
  def show
    @articles = current_user.articles.all
    user_articlelikes
  end

  def user_articlelikes
    @articlelikes = current_user.user_articlelikes
  end
end
