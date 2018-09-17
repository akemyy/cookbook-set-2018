class Recipe < ApplicationRecord
  has_attached_file :photo 
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/, message: "Tipo da imagem não é válido"

  belongs_to :recipe_type
  belongs_to :cuisine

  validates :title, :cuisine, :difficulty, :cook_time,
            :ingredients, :cook_method, presence: true

  def cook_time_min
    "#{cook_time} minutos"
  end
end
