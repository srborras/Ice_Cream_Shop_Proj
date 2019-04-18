class Shift < ApplicationRecord
    
    # Callbacks
    before_create :set_end, if: Assignment.find(self.assignment_id).end_date != nil
    
    # Relations
    belongs_to :assignments
    has_many :shift_jobs
    has_many :jobs, through: :shift_job
    
    # Validations
    validates_presence_of :date, :start_time, :assignment_id
    
    # Scopes
    scope :completed, -> { joins(:shift_job).where.not(job_id: nil) }
    scope :incompleted, -> { joins(:shift_job).where(job_id: nil) }
    
    #Check Join
    scope :for_store, -> (store_id) { joins(:assignment).where("store_id = ?". store_id) }
    scope :for_employee, -> (employee_id) { joins(:employee).where("employee_id = ?". employee_id) }
    
    scope :past, -> { where("date < ?", Date.now.to_date) }
    scope :upcoming, -> { where("date >= ?", Date.now.to_date) }
    
    #Check Syntax
    scope :for_next_days, -> (num){ where("date >= ?", num.days.from_now ) }
    scope :for_past_days, -> (num){ where("date < ?", num.days.from_now ) }
    scope :by_store, -> { joins(:assignment => :store ).order('name')}
    scope :by_employee, -> { joins(assignment: :employee ).order('last_name, first_name')}
    
    private
    
    def set_end
        time = self.start_time.t_time + 3*60
        self.end_time = time
    end
    
    def completed?
        all_shiftjobs = Shiftjob.all.map{|e|}
    end
    
    
    
end
