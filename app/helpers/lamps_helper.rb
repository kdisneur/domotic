module LampsHelper
  def sub_menu_lamps
    items = [
      [:index, t('submenu.lamps.show_all'),    lamps_path],
      [:new,   t('submenu.lamps.create_lamp'), new_lamp_path],
    ]

    sub_menu items
  end
end
