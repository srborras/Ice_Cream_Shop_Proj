require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # Test Relations
  should belong_to(:employee)
  
  # Test Validations
  should validate_uniqueness_of(:email)
  
  # Context
  context "Creating a context for stores" do
    # create the objects I want with factories
    setup do 
      create_users
    end
    
    # and provide a teardown method as well
    teardown do
      remove_users
    end

  end

end
