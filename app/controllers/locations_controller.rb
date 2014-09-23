class LocationsController < ApplicationController

  def new
    @locations = Location.all
    @location = Location.new
  end

  def index
    @locations = Location.all

    respond_to do |format|
      format.html
      format.json { render :json => @locations }
    end
  end


  def create
    @location = Location.create(location_params)
    if @location.save
      flash[:notice] = "Location Added."
      redirect_to new_location_path
    else
      render 'new'
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def show
    @location = Location.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @location }
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    flash[:alert] = "Location Deleted."
    redirect_to new_location_path
  end

  def update
    @location = Location.find(params[:id])

    if @location.update(location_params)
      flash[:notice]= "Your location has been updated."
      redirect_to locations_path
    else
      flash[:alert]= "Your location failed to update."
      render('show')
    end
  end

  private
    def location_params
      params.require(:location).permit(:address, :name)
    end

end
