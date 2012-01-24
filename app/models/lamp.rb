class Lamp < ActiveRecord::Base

  belongs_to :room

  validates :name,       :presence     => true
  validates :house_code, :presence     => true
  validates :unit_code,  :presence     => true
  validates :unit_code,  :numericality => { :only_integer => true, :greater_than => 0, :less_than => 17 }
  validates :house_code, :inclusion    => { :in => Domotic::Data::House_code, :message => I18n.t("activerecord.errors.models.lamp.attributes.house_code.is_not_a_valid_house_code")}

  composed_of :module,
              :class_name => "Cm15::Components::Lamp",
              :mapping => [%w(name name), %w(house_code house_code), %w(unit_code unit_code)]

  self.per_page = 5
end
