class OrderForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Please enter numbers only' }
    validates :token
  end

  def save
    ActiveRecord::Base.transaction do
      order = Order.create!(item_id: item_id, user_id: user_id)
      Address.create!(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building,
                      phone_number: phone_number, order_id: order.id)
    end
  rescue ActiveRecord::RecordInvalid
    false
  end
end
