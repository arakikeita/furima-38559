class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping
  belongs_to :area
  belongs_to :scheduled_day

  validates :image, presence: true
  

  
  validates :name, presence: true

  validates :content, presence: true

  validates :category_id, numericality: { ohter_than: 1 }
  validates :state_id, numericality: { ohter_than: 1 }
  validates :shipping_id, numericality: { ohter_than: 1 }
  validates :area_id, numericality: { ohter_than: 1 }
  validates :scheduled_day_id, numericality: { ohter_than: 1 }

  validates :price,presence: true,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
            format: { with: /\A[0-9]+\z/ }

  


























end
