class BuyAddress
  
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post, :area_id, :city, :num, :building, :telephone, :token


  with_options presence: true do 
    validates :post,format:{ with: /\A\d{3}[-]\d{4}\z/ }
    validates :area_id,numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :num
    validates :telephone,format:{ with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
    validates :token

  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(post: post, area_id: area_id, city: city, num: num, building: building, telephone: telephone , buy_id: buy.id)
  end
end