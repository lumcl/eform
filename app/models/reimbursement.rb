class Reimbursement < ActiveRecord::Base
  self.primary_key = 'uuid'
  belongs_to :user
  belongs_to :owner, :class_name => 'User'
  belongs_to :creator, :class_name => 'User'
  belongs_to :updater, :class_name => 'User'

end
