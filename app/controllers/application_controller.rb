class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :active_menu, :active_sub_menu

  def active_menu
    @active_menu ||= self.controller_name.to_sym
  end

  def active_sub_menu
    @active_sub_menu ||= self.action_name.to_sym
  end
end
