class LampScheduler < ActiveRecord::Base
  def self.update_status
    logger.debug "Start the update of lamp status"
    Lamp.all.each do |lamp|
      begin
        lamp.status = lamp.module.status
        lamp.save!
      rescue
        logger.warn "Cannot update status of the '#{lamp.name}' lamp"
      end
    end
    logger.debug "End the update of lamp status"
  end
end