class Post < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :user

  has_attached_file :postimage, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :postimage, content_type: /\Aimage\/.*\z/
end
