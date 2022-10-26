class PointsController < ApplicationController
  def index
  end

  def new
    @branch = Branch.find(params[:branch_id])
    @point = Point.new
    @all_point = @branch.point.all
    @count = @branch.point.count

    # auto increment delivery point
    @increment_delivery_point = Point.last.branch.nil? ? "0" : @branch.point.last.delivery_point.to_i + 1
  end

  def create
    @branch = Branch.find(params[:branch_id])
    @point = Point.create(point_params)
    if @branch.save && @point.save
      redirect_to new_branch_point_path
    end
  end

  def edit
    @point = Point.find(params[:id])
    @branch = Branch.find(params[:branch_id])
  end

  def update
    @branch = Branch.find(params[:branch_id])
    if @point = Point.find(params[:id]).update(point_params)
      redirect_to branch_path(@branch.id)
    end
  end

  def show
    @point = Point.find(params[:id])
    @branch = Branch.find(params[:branch_id])
  end

  def destroy
    @point = Point.find(params[:id])
    @branch = Branch.find(params[:branch_id])
    if @point.destroy!
      redirect_to branch_path(@branch.id)
    end
  end

  private
  def point_params
    params.require(:point).permit(:delivery_point,:section,:house_number,:moo,:village,
                                  :road,:sub_district,:district,:province,:landmark,:branch_id)
  end

end
