class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping
  belongs_to :area
  belongs_to :scheduled_day


  validates :name, presence: true

  validates :content, presence: true

  validates :category, numericality: { ohter_than: 1 }
  validates :state, numericality: { ohter_than: 1 }
  validates :shipping, numericality: { ohter_than: 1 }
  validates :area, numericality: { ohter_than: 1 }
  validates :scheduled_day, numericality: { ohter_than: 1 }

  validates :price,presence: true,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
            format: { with: /\A[0-9]+\z/ }

  


























end
