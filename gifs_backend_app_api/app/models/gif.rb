class Gif < ApplicationRecord
     has_one_attached :gif_file
     validate :acceptable_gif

     def acceptable_gif
          return unless gif_file.attached?

          #unless gif_file.content_type == "image/gif"
          #     errors.add(:gif_file, "Must be a .gif file!")
          #end

          unless gif_file.byte_size <= 2.megabyte
               errors.add(:gif_file, "Must be less than 2 megabytes")
          end
     end
end
