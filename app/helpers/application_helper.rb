module ApplicationHelper
  def main_menu
    menu_items = [
      [:overview, t('menu.overview'), overview_index_path],
      [:rooms,    t('menu.rooms'),    rooms_path],
      [:lamps,    t('menu.lamps'),    lamps_path],
    ]
    capture_haml do
      haml_tag :ul, :class => "pills" do
        menu_items.each do |name, label, url|
          css_class = @active_menu == name ? "active" : ""
          haml_tag :li, :class => css_class do
            haml_tag :a, label,:href => url
          end
        end
      end
    end
  end

  def sub_menu items
    capture_haml do
      haml_tag :ul, :class => "tabs" do
        items.each do |name, label, url|
          css_class = name == @active_sub_menu ? "active" : ""
          haml_tag :li, :class => css_class do
            haml_tag :a, label, :href => url
          end
        end
      end
    end
  end
end
