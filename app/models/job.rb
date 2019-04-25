class Job < ApplicationRecord
    
    # Callbacks
    before_destroy :maybe_destroy?
    after_rollback :make_inactive
    
    # Relations
    has_many :shiftjobs
    has_many :shifts, through: :shiftjobs
    
    # Validations
    validates_presence_of :name
    
    # Scopes
    scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }
    scope :alphabetical, -> { order('name') }
    
    # Methods
    def stop_destroy
        if maybe_destroy?
            self.errors.add(:base, "Cannot delete a Store!")
            throw(:abort)
        end
    end
    
    def maybe_destroy?
        maybe_destroy = self.shiftjobs.empty?
    end
    
    def make_inactive
        self.update_attribute(:active, false)
    end
    
    
    # Check syntax or logic
    # def inactive
    #     all_shiftjobs = Shiftjob.where("job_id = ?", self.id)
    #     for i in all_shiftjobs
    #         if i.shift_id == nil
    #             self.active == false
    #         else
    #             self.destroy
    #         end
    #     end
    # end
    
    
end
