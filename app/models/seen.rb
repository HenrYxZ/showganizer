class Seen < ActiveRecord::Base
  belongs_to :user
  belongs_to :show

  validates :user, :show, presence: true
end
