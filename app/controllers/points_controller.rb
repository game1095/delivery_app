class PointsController < ApplicationController
  def index
  end

  def new
    @point = Point.new
  end

  def create
    if @point = Point.create(point_params)
      redirect_to root_path
    end
  end

  def edit
    @point = Point.find(params[:id])
  end

  def update

  end

  def destroy

  end

  private
  def point_params
    params.require(:point).permit(:delivery_point,:section,:house_number,:moo,:village,
                                  :road,:sub_district,:district,:province,:landmark,:branch_id)
  end

end
