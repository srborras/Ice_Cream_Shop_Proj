module Contexts
  module ShiftjobContexts
    # Context for stores 
    def create_shiftjob
        @cindy_prepfood = FactoryBot.create(:shiftjob, shift: @shift_assign_cindy, job: @prep_food)
        @ed_prepfood = FactoryBot.create(:shiftjob, shift: @shift_assign_ed, job: @prep_food)
        @kathryn_leftover = FactoryBot.create(:shiftjob, shift: @shift_assign_kathryn, job: @leftover)
        @ben_trash = FactoryBot.create(:shiftjob, shift: @shift_assign_ben, job: @trash)
    end
    
    def remove_shiftjob
        @cindy_prepfood.destroy
        @ed_prepfood.destroy
        @kathryn_leftover.destroy
        @ben_trash.destroy
    end
  end
end