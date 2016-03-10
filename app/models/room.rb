class Room < ActiveRecord::Base
	belongs_to :user
  
  def complete_name
	"#{title}, #{location}"
  end
  
  def self.most_recent
    order(created_at: :desc)
  end
end
