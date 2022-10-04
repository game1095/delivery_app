class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @branchs = Branch.all
  end
end
