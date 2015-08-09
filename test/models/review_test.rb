require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  
  def setup
    @marketer = marketer.create(marketername: "bob", email: "bob@example.com")
    @idea = @marketer.ideas.build(name: "chicken parm", summary: "this is the best chicken parm recipe ever",
              description: "heat oil, add onions, add tomato sauce, add chicken, cook for 20 minutes")
    @review = @marketer.review.build(body: "This is the best recipe of all time you are the best chef of all time alton brown sux!")
  end
  
  test "body must be present" do
    @review.body = " "
    assert_not @review.valid?
  end
  
  test "body should not be too long" do
    @idea.body = "a" * 501
    assert_not @review.valid?
  end
  
  test "body should not be too short" do
    @idea.body = "a" * 19
    assert_not @review.valid?
  end
  
end