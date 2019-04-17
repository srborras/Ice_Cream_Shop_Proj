class Shift < ApplicationRecord
    
    # Callbacks
    before_create :set_end, if: Assignment.find(self.assignment_id).end_date != nil
    
    # Relations
    belongs_to :assignments
    has_many :shift_jobs
    
    # Validations
    validates_presence_of :date, :start_time, :assignment_id
    
    # Scopes
    scope :completed
    scope :incompleted
    scope :for_store
    
    private
    
    def set_end
        time = self.start_time.t_time + 3*60
        self.end_time = time
    end
    
end
