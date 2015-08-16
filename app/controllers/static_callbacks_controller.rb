class StaticPagesController < ApplicationController

  def home
    @book = current_user.books.build if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end