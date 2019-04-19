class Job < ApplicationRecord
    
    # Callbacks
    #before_destroy :make_inactive
    
    # Relations
    has_many :shift_jobs
    has_many :shifts, through: :shift_jobs
    
    # Validations
    validates_presence_of :name
    
    # Scopes
    scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }
    scope :alphabetical, -> { order('name') }
    
    # Callback code
    private
    
    # Check syntax or logic
    def inactive
        all_shiftjobs = Shiftjob.where("job_id = ?", self.id)
        for i in all_shiftjobs
            if i.shift_id == nil
                self.active == false
            else
                self.destroy
            end
        end
    end
    
    
end
