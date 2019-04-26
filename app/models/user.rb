class User < ApplicationRecord
    
    has_secure_password
    
    # Callbacks
    before_create :employee_active
    
    # Relations
    belongs_to :employee
    
    # Validations
    validates_presence_of :email, :password_digest, :employee_id
    validates_uniqueness_of :email
    
    # Methods
    
    def employee_active
        @check_active = self.employee.active
    end
    
    def role?(authorized_role)
        return false if self.employee.nil?
        return false if self.employee.role.nil?
        self.employee.role.downcase.to_sym == authorized_role
    end
    
end
