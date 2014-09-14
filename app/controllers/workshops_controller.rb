class WorkshopsController < ApplicationController

  def index
    @workshops = Workshop.all
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
      flash[:notice] = "Workshop Added."
      redirect_to workshops_path
    else
      render 'new'
    end
  end

  def edit
    @workshop = Workshop.find(params[:id])
  end

  def show
    @workshop = Workshop.find(params[:id])
  end

  def destroy
    @workshop = Workshop.find(params[:id])
    @workshop.destroy
    flash[:alert] = "Workshop deleted."
    redirect_to new_workshop_path
  end

  def update
    @workshop = Workshop.find(params[:id])
    if @workshop.update(workshop_params)
      flash[:notice]= "Your Workshop has been updated."
      redirect_to workshop_path
    else
      flash[:notice]= "Your Workshop failed to update."
      render('show')
    end
  end

  private
    def workshop_params
      params.require(:workshop).permit(:title, :presenter, :description, :duration, :location_id, :user_id, :slot_id)
    end
end
