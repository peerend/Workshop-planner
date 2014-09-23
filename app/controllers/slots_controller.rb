class SlotsController < ApplicationController

  def new
    @slots = Slot.all
    @slot = Slot.new
  end

  def index
    @slots = Slot.all

    respond_to do |format|
      format.html
      format.json { render :json => @slots }
    end
  end

  def create
    @slot = Slot.create(slot_params)
    if @slot.save
      flash[:notice] = "Time Slot Added."
      redirect_to new_slot_path
    else
      render 'new'
    end
  end

  def edit
    @slot = Slot.find(params[:id])
  end

  def show
    @slot = Slot.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @slot }
    end
  end

  def destroy
    @slot = Slot.find(params[:id])
    @slot.destroy
    flash[:alert] = "time slot deleted."
    redirect_to new_slot_path
  end

  def update
    @slot = Slot.find(params[:id])

    if @slot.update(slot_params)
      flash[:notice]= "Your Time Slot has been updated."
      redirect_to slots_path
    else
      flash[:notice]= "Your time slot failed to update."
      render('show')
    end
  end

  private
    def slot_params
      params.require(:slot).permit(:time)
    end

end
