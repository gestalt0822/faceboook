class Topic < ActiveRecord::Base
  validates :title, presence: true
  validates :name, presence: true
  validates :content, presence: true
end
