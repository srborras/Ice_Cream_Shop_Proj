module Contexts
  module ShiftContexts
    # Context for assignments (assumes contexts for stores, employees)
    def create_shifts
        @shift_assign_cindy = FactoryBot.create(:shifts, assignment: @assign_cindy)
    end
    
    def remove_shifts
        @shift_assign_cindy.destroy
    end

  end
end