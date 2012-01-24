class OverviewController < ApplicationController

  respond_to :html
  
  expose(:rooms) { Room.all }

end
