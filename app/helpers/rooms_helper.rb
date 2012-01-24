module RoomsHelper
  def sub_menu_rooms
    items = [
      [:index, t('submenu.rooms.show_all'),    rooms_path],
      [:new,   t('submenu.rooms.create_room'), new_room_path],
    ]

    sub_menu items
  end
end
