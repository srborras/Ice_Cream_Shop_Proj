class Shift < ApplicationRecord
    
    # Callbacks
    # Check conditional
    # after_commit :set_end #, if: Assignment.find(self.assignment_id).end_date != nil
    
    # Relations
    belongs_to :assignment
    has_many :shiftjobs
    has_many :jobs, through: :shiftjobs
    
    # Validations
    validates_presence_of :date #, :start_time, :assignment_id
    validate :curr_assign, on: :create
    validate :can_delete, on: :delete
    
    # Scopes
    scope :completed, -> { joins(:shift_job).where.not(job_id: nil) }
    scope :incompleted, -> { joins(:shift_job).where(job_id: nil) }
    
    #Check Join
    scope :for_store, -> (store_id) { joins(:assignment).where("store_id = ?". store_id) }
    scope :for_employee, -> (employee_id) { joins(:assignment).where("employee_id = ?". employee_id) }
    
    scope :past, -> { where("date < ?", Date.now.to_date) }
    scope :upcoming, -> { where("date >= ?", Date.now.to_date) }
    
    #Check Syntax
    scope :for_next_days, -> (num){ where("date >= ?", num.days.from_now ) }
    scope :for_past_days, -> (num){ where("date < ?", num.days.from_now ) }
    scope :by_store, -> { joins(:assignment => :store ).order('name')}
    scope :by_employee, -> { joins(assignment: :employee ).order('last_name, first_name')}
    
    
    # Private methods for callbacks and validations
    private
    
    def set_end
        time = self.start_time.t_time + 3*60
        self.end_time = time
    end
    
    def curr_assign
        curr_assignment = Assignment.find(self.assignment_id).end_date
        unless curr_assignment == nil #.nil?
            errors.add(:assignment_id, "Is not a current assignment")
        end
        
    end
    
    def can_delete
        curr_shift = self.date.to_date
        unless curr_shift <= Data.now.to_date
            errors.add(:date, "The date has passed")
        end
    end
    
    # Check Syntax
    def completed?
        all_shiftjobs = Shiftjob.where("shift_id = ?", self.id)
        for x in all_shiftjobs
            if x.job_id == nil
                return false
            end
        end
    end
    
    def start_now
        curr_time = Time.now.to_time
        self.start_time = curr_time
    end
    
    def end_now
        curr_time = Time.now.to_time
        self.start_time = curr_time
    end
    
    
end
