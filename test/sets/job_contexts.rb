module Contexts
  module JobContexts
    # Context for stores 
    def create_jobs
      @prep_food = FactoryBot.create(:job)
      @leftover = FactoryBot.create(:job, name: "Leftovers", description: "Do something with the leftover food")
      @trash = FactoryBot.create(:job, name: "Trash", description: "Throw away the trash", active: false)
      
    end
    
    def remove_jobs
      @prep_food.destroy
      @leftover.destroy
      @trash.destroy
    end
  end
end