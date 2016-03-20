class Quote < ActiveRecord::Base
  belongs_to :deck

  validates_presence_of :content

end
