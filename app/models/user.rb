class User < ApplicationRecord
    
    # Relations
    belongs_to :employee
    
    # Validations
    validates_uniqueness_of :email
    validate :employee_is_active_in_system, on: :create
    
    # Methods
    
    has_secure_password
    
    def employee_is_active_in_system
        all_active_employees = Employee.active.all.map{|e| e.id}
        unless all_active_employees.include?(self.employee_id)
          errors.add(:employee_id, "is not an active employee at the creamery")
        end
    end
    
end
