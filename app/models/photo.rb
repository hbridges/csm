class Photo < ApplicationRecord
    validates :name, presence: true
    belongs_to :album
    mount_uploader :picture, PictureUploader
end
