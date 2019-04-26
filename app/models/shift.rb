class Shift < ApplicationRecord
    
    # Callbacks
    # Check conditional
    # before_create :set_end #, if: Assignment.find(self.assignment_id).end_date != nil
    # before_create :curr_assign
    # before_delete :
    
    # Relations
    belongs_to :assignment
    has_many :shiftjobs
    has_many :jobs, through: :shiftjobs
    
    # Validations
    validates_presence_of :date, :start_time, :assignment_id
    validates_time :start_time
    validates_time :end_time, after: :start_time
    
    # Scopes
    scope :completed, -> { joins(:shift_job).where.not(job_id: nil) }
    scope :incompleted, -> { joins(:shift_job).where(job_id: nil) }
    
    #Check Join
    scope :for_store, -> (store_id) { joins(:assignment).where("store_id = ?". store_id) }
    scope :for_employee, -> (employee_id) { joins(:assignment).where("employee_id = ?". employee_id) }
    
    scope :past, -> { where("date < ?", Date.today) }
    scope :upcoming, -> { where("date >= ?", Date.today) }
    
    #Check Syntax
    scope :chronological, -> {order(:date)}
    scope :for_next_days, -> (num){ where("date >= ?", num.days.from_now ) }
    scope :for_past_days, -> (num){ where("date < ?", num.days.from_now ) }
    scope :by_store, -> { joins(:assignment => :store ).order('name')}
    scope :by_employee, -> { joins(assignment: :employee ).order('last_name, first_name')}
    
    
    # Private methods for callbacks and validations
    private
    
    def set_end
        time = self.start_time.to_time + (3*60*60)
        self.end_time = time
    end
    
    def is_it_current
        unless self.assignment.nil? or self.assignment.end_date.nil?
            errors.add(:assignment_id, "is not a current assignment")
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
        self.shift_jobs.size > 0
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
