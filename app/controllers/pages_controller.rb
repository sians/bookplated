class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :check_signed_in, only: [:home]

  def home
  end

  def stats
  end

  private

  def check_signed_in
    redirect_to user_books_path(current_user) if signed_in?
  end
end
