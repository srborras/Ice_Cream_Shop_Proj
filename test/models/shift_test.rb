require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  
  # Test Relations
  should belong_to(:assignment)
  should have_many(:shiftjobs)
  should have_many(:jobs).through(:shiftjobs)
  
  # Test Validations
  should validate_presence_of(:date)
  should validate_presence_of(:start_time)
  should validate_presence_of(:assignment_id)
  
  
  
end
