class Novel < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title, :content
  end
end
