class WorkshopsController < ApplicationController

  def index
    @workshops = Workshop.all
    @workshops_grid = initialize_grid(Workshop,
      :include => [:slot],
      :order => 'id'
    )
    @locations = Location.all
    @hash = Gmaps4rails.build_markers(@locations) do |location, marker|
      titles = []
      marker.lat location.latitude
      marker.lng location.longitude
      titles << "Address: " + location.address
      location.workshops.each do |workshop|
        titles << workshop.title + ' '
      end
      marker.infowindow titles.join("<br>")
    end

    respond_to do |format|
      format.html
      format.json { render :json => @workshops }
    end
  end

  def new
    @workshop = Workshop.new
    @workshops = Workshop.all
    @locations = Location.all
    @slots = Slot.all
  end

  def create
    @workshop = Workshop.create(workshop_params)
    if @workshop.save
      respond_to do |format|
        format.html do
          flash[:notice] = "Workshop created."
          redirect_to root_path
        end
        format.json { render :json => @workshop, :status => 201 }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.json { render :json => @workshop.errors, :status => 422 }
      end
    end
  end

  def edit
    @workshop = Workshop.find(params[:id])
  end

  def show
    @workshop = Workshop.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @workshop }
    end
  end

  def destroy
    @workshop = Workshop.find(params[:id])
    @workshop.destroy
    flash[:alert] = "Workshop deleted."
    redirect_to root_url

    respond_to do |format|
      format.html do
        flash[:notice] = "Workshop deleted."
        redirect_to workshops_path
      end
      format.json { head :no_content }
    end
  end

  def update
    @workshop = Workshop.find(params[:id])
    if @workshop.update(workshop_params)
      respond_to do |format|
        format.html do
          flash[:notice] = "Workshop updated."
          redirect_to workshop_path(@workshop)
        end
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { render 'edit' }
        format.json { render :json => @workshop.errors, :status => 422 }
      end
    end
  end

  private
    def workshop_params
      params.require(:workshop).permit(:title, :presenter, :description, 
                                       :duration, :location_id, :user_id, :slot_id)
    end
end
