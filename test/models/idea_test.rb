require "test_helper"
class IdeaTest < ActiveSupport::TestCase
    def setup
        @marketer = Marketer.create(marketername: "bob", email: "bob@example.com")
        @idea = @marketer.ideas.build(name: "the method.com", summary: "The Method.com is a web service that helps indevduals retain knollege in their own way.", description: "More importantly, the method.com teaches you how to use knowledge practically to grow socially and economically" )
        
    end
    
    test "idea should be valid" do
      assert @idea.valid?
    end
    
    test "chef_id should be present" do
      @idea.marketer_id = nil
      assert_not @idea.valid?
    end
    
    test "name should be present" do
      @idea.name = ""
      assert_not @idea.valid?
    end
    
    test "name length should not be too long" do
      @idea.name = "a" * 101
      assert_not @idea.valid?    
    end
    
    test "name length should not be too short" do
      @idea.name = "aaaa"
      assert_not @idea.valid?
    end
    
    test "summary should be present" do
      @idea.summary = ""
      assert_not @idea.valid?
    end
    
    test "summary length should not be too long" do
      @idea.summary = "a" * 151
      assert_not @idea.valid?
    end

    test "summary length should not be too short" do
      @idea.summary = "a" * 9
      assert_not @idea.valid?
    end
    
    test "description must be present" do
        @recipe.discription = "a" * 501
        assert_not @recipe.valid?
    end
    
    test " discription should not be too short" do
        @idea.description = "a" * 19
        assert_not @idea.valid?
    end
end
