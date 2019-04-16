class Shift < ApplicationRecord
    
    # Callbacks
    
    # Relations
    belongs_to :assignments
    belongs_to :employees, through: :assignments
    
    # Validations
    validates_presence_of :date, :start_time, :assignment_id
    
    # Scopes
    scope :completed
    scope :incompleted
    scope :for_store
    
end
