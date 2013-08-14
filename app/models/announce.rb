class Announce < ActiveRecord::Base
  attr_accessible :action_date, :desc, :lg, :lt, :title, :user_id, :disabled, :image, :tag_1, :tag_2, :tag_3
  belongs_to :user
  mount_uploader :image, AnnounceImageUploader


  def title_feed
    shorter 24, title
  end

  def title_resize(length)
    shorter length, title
  end

  def shorter(length, field)
    string_arr = field.split(//)
    field.length > length ? "#{string_arr[0..(length-1)].join('')}..." : field
  end

  def self.active
    where :disabled => false
  end

  def self.disabled
    where :disabled => true
  end
end
