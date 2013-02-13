class Author < ActiveRecord::Base
  attr_accessible :name

  belongs_to :post, :autosave => true
end
