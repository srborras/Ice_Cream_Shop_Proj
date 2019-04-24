require 'test_helper'

class StoreflavorTest < ActiveSupport::TestCase
  
  # Testing Relations
  should belong_to(:flavor)
  should belong_to(:store)
  
end
