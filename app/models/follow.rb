class Follow < ActiveRecord::Base

  belongs_to :follow, :class_name => "User"

end
