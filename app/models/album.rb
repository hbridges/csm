class Album < ApplicationRecord
    validates :name, presence: true
    has_many :photos
    mount_uploader :picture, PictureUploader
end
