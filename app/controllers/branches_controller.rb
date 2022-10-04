class BranchesController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def new
    @branch = Branch.new
  end

  def create
    if @branch = Branch.create(branch_params)
      redirect_to root_path
    end

  end

  def edit

  end

  def update

  end

  def show

  end

  def destroy

  end

  private
    def branch_params
      params.require(:branch).permit(:name , :branch_type_id , :post_office_id)
    end
end
