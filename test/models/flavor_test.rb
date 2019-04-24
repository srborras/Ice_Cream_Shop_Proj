require 'test_helper'

class FlavorTest < ActiveSupport::TestCase
  
  # Test Relations
  should have_many(:storeflavors)
  should have_many(:stores).through(:storeflavors)
  
  # Test Validations
  should validate_presence_of(:name)
  
  context "Creating a context for flavors" do
    
    setup do
      create_flavors
    end
    
    teardown do
      remove_flavors
    end
    
    should "Show 3 active flavors" do
      assert_equal ["Chocolate", "Cookies & Cream", "Vanilla"], Flavor.active.alphabetical.map{|s| s.name}
    end
    
    should "Show 2 inactive flavors" do
      assert_equal ["Mango", "Strawberry"], Flavor.inactive.alphabetical.map{|s| s.name}
    end
    
    should "Show the names in alphabetical order" do
      assert_equal ["Chocolate", "Cookies & Cream", "Mango", "Strawberry", "Vanilla"], Flavor.alphabetical.map{|s| s.name}
    end
    
    should "Show the active status as false" do
      @choco.make_inactive
      assert_equal false, @choco.active
    end
    
  end
  
end
