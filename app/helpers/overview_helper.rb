module OverviewHelper

  def sub_menu_overview
    items = [
      [:index, "Installation",    overview_index_path],
    ]

    sub_menu items
  end

  def draw_installation rooms
    printing    = ''
    rooms.each do |room|
      lamps             = room.lamps
      lamps_entity_ids  = lamps.map(&:id).join ','
      lamps_entities    = lamps.map {|lamp| "(#{lamp.id}:{{<a href=\"#{lamp_path lamp}\">#{lamp.name}</a>}})" }.join ' '
      
      if lamps.length == 0
        printing  += "({{<a href=\"#{room_path room}\">#{room.name}</a>}})"
      else
        printing  += "({{<a href=\"#{room_path room}\">#{room.name}</a>}}>[#{lamps_entity_ids}]) || #{lamps_entities}"
      end
      printing += " || "
    end

    capture_haml do 
      haml_tag :pre, printing, :class => 'arrows-and-boxes'
    end
  end
end