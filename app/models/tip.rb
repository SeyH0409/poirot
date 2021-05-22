class Tip < ApplicationRecord
  belongs_to :user
  belongs_to :novel
  attr_accessor :token

  with_options presence: true do
    validates :price, format: { with: /\A[0-9]+\z/ },
                      numericality: {greater_than: 49, less_than: 1001}
    validates :token
  end

end
