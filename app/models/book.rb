class Book < ApplicationRecord
belongs_to :user
has_one_attached :image

validates :title, presence:true
validates :body,length:{maximum: 200}, presence:true

end
