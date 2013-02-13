class Post < ActiveRecord::Base
  has_one :author, :autosave => true
  has_many :comments, :autosave => true
end
