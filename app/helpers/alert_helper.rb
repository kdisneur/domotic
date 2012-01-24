module AlertHelper
  def show_notices message
    return if message.nil?
    capture_haml do 
      haml_tag :div, :class => "alert-message success", "data-alert" => "" do 
        haml_tag :a, "x", :href => "#", :class => "close"
        haml_tag :p, message
      end
    end
  end
end
