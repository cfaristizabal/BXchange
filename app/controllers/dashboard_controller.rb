class DashboardController < ApplicationController
  def dashboard
    @book = current_user.books
  end
end
