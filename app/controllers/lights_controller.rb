class LightsController < ApplicationController

  expose(:lamp)

  def create
    light {|lamp| lamp.module.light_on }
  end

  def destroy
    light {|lamp| lamp.module.light_off }
  end

  private

  def light &block
    block.call lamp
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.text { render :nothing => true, :status => 200 }
    end
  end
end
