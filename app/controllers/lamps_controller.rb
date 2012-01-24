class LampsController < ApplicationController

  respond_to :html
  
  expose(:paging_lamps) { Lamp.paginate(:page => params[:page]) }
  expose(:lamp)
  expose(:rooms) { Room.all }

  def show_partial
    render :partial => 'listing_lamps'
  end

  def create
    if lamp.save
      redirect_to lamp, :notice => t('lamps.controller.created')
    else
      @active_sub_menu = :new
      render :action => "new"
    end
  end

  def update
    if lamp.update_attributes(params[:lamp])
      redirect_to lamp, :notice => t('lamps.controller.updated')
    else
      render :action => "edit"
    end
  end

  def destroy
    lamp.destroy
    redirect_to lamps_url
  end
end
