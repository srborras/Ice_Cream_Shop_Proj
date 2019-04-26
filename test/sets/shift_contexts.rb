module Contexts
  module ShiftContexts
    # Context for assignments (assumes contexts for stores, employees)
    def create_shifts
        @shift_assign_cindy = FactoryBot.create(:shift, assignment: @assign_cindy)
        @shift_assign_ed = FactoryBot.create(:shift, assignment: @assign_ed)
        @shift_assign_kathryn = FactoryBot.create(:shift, assignment: @assign_kathryn)
        @shift_assign_ben = FactoryBot.create(:shift, assignment: @assign_ben)
    end
    
    def remove_shifts
        @shift_assign_cindy.destroy
        @shift_assign_ed.destroy
        @shift_assign_kathryn.destroy
        @shift_assign_ben.destroy
    end

  end
end