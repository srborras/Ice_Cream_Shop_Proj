require 'test_helper'

class StoreflavorTest < ActiveSupport::TestCase
  
  # Testing Relations
  should belong_to(:flavor)
  should belong_to(:store)
  
  # Contexts
  context "Creating a context for storeflavors" do
    
    setup do
      create_stores
      create_flavors
      create_storeflavors
    end
    
    teardown do
      remove_stores
      remove_flavors
      remove_storeflavors
      
    end
    
  end
  
end
