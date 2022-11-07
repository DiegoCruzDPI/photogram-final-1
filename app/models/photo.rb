# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :text
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#
class Photo < ApplicationRecord
  belongs_to :user_photo, :class_name => "User", :foreign_key => "owner_id"

  has_many :comments, :class_name => "Comment", :foreign_key => "photo_id"

  has_many :likes, :class_name => "Like", :foreign_key => "photo_id"

  has_many :user_likes, :through => :likes, :source => :fan
  
  def name_of_fans
      fan_names = self.user_likes

      array_of_names = Array.new

      fan_names.each do |a_user|

        array_of_names.push(a_user.username)
      end

      formatted_names = array_of_names

      return formatted_names
  end
end
