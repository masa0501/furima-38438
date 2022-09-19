class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :days
  has_one_attached :image

  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_id, numericality: { other_than: 1 , message: "can't be blank"}
end
