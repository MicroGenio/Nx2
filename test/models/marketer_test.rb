require 'test_helper'

class MarketerTest < ActiveSupport::TestCase
    
    def setup
        @marketer = Marketer.new(marketername:"john", email: "john@example.com")
    end
    
    test "marketer should be valid" do
        assert @marketer.valid?
    end
    
    test "marketername should be present" do
        assert_not @marketer.valid?
    end
    
    test "marketername should not be to long" do
        @marketer.marketername = "a" * 41
        assert_not @marketer.valid?
    end
    
    test "marketername should not be to short" do
        @marketer.marketername = "aa" 
        assert_not @marketer.valid? 
    end
    
    test "email should be present" do
        @marketer.email = ""
        assert_not @marketer.valid?
        
    test "email length should be within bounds" do
        @marketer.email = "a" * 101 + "@example.com"
        assert_not @marketer.valid?
    
    test "emil address should be unique" do
        dup_marketer = @marketer.dup_marketer
        dup_marketer.email = @marketer.email.upcase
        @marketer.save
        assert_not dup_marketer.valid?
    end
    
    test "email validation should accep valid addresses" do
        valid_addresses = %w[user@eee.com R_TDD-DS@ee.hello.org user@example.com first.last@eem.au laura+joe@monk.cm]
        valid_addresses.each do |va| 
            @marketer.email = va 
            assert @marketer.valid?, '#{va.inspect} should be valid'
        end
    end
    
    test "email validation should reject invalid addresses" do
        invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am_.com foo@ee+aar.com]
        invalid_addresses.each do |ia|
            @marketer.email = ia
            assert_not @marketer.valid?, '#{ia.inspect} should be invalid'
        end
    end