class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :buy


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping
  belongs_to :area
  belongs_to :scheduled_day

  validates :image, presence: true
  

  
  validates :name, presence: true

  validates :content, presence: true

  with_options presence: true , numericality: { other_than: 1 ,message: "can't be blank"} do 
    validates :category_id 
    validates :state_id
    validates :shipping_id
    validates :area_id
    validates :scheduled_day_id
  end


  
  validates :price,presence: true,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
            format: { with: /\A[0-9]+\z/ }


end
