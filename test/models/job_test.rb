require 'test_helper'

class JobTest < ActiveSupport::TestCase
  
  should have_many(:shiftjobs)
  should have_many(:shifts).through(:shiftjobs)
  
  should validate_presence_of(:name)
  
  context "Creating a context for jobs" do
    # create the objects I want with factories
    setup do 
      create_jobs
      
    end
    
    # and provide a teardown method as well
    teardown do
      remove_jobs
    end
  
    should "show all the jobs by alpbaetical order" do
      assert_equal ["Leftovers", "Prep food", "Trash"], Job.alphabetical.map{|s| s.name}
    end
    
    should "show all the jobs that are active" do
      assert_equal ["Leftovers", "Prep food",], Job.alphabetical.active.map{|s| s.name}
    end
    
    should "show all the jobs that are inactive" do
      assert_equal ["Trash"], Job.alphabetical.inactive.map{|s| s.name}
    end
    
  end
  
  
end
