class RoomsController < ApplicationController

  respond_to :html
  
  expose(:paging_rooms) { Room.paginate(:page => params[:page]) }
  expose(:paging_lamps) { Lamp.paginate(:page => params[:page]) }
  expose(:lamps) { Lamp.all }
  expose(:room)

  def show_partial
    render :partial => 'listing_rooms'
  end

  def create
    if room.save
      redirect_to room, :notice => t('rooms.controller.created')
    else
      @active_sub_menu = :new
      render :action => "new"
    end
  end

  def update
    if room.update_attributes(params[:room])
      redirect_to room, :notice => t('rooms.controller.updated')
    else
      render :action => "edit"
    end
  end

  def destroy
    room.destroy
    redirect_to rooms_url
  end
end
