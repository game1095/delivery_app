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
    @branch = Branch.find(params[:id])
  end

  def update
    if @branch = Branch.find(params[:id]).update(branch_params)
      redirect_to root_path
    end
  end

  def show
    @branch = Branch.find(params[:id])
    @count = @branch.point.count

  end

  def destroy
    @branch = Branch.find(params[:id])

    if @branch.destroy
      redirect_to root_path
    end
  end

  private
    def branch_params
      params.require(:branch).permit(:name , :north, :south, :west, :east , :important_place ,
                                    :important_road , :geography , :branch_type_id , :post_office_id)
    end
end
