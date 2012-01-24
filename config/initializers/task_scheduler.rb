scheduler = Rufus::Scheduler.start_new

scheduler.every 5.minutes do
  LampScheduler.update_status
end