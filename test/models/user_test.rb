require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # Test Relations
  should belong_to(:employee)

end
