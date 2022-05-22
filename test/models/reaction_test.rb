require 'test_helper'

class ReactionTest < ActiveSupport::TestCase
  
  def setup
    @reaction = Reaction.new(user_id: users(:michael).id,
                                     micropost_id: microposts(:ants).id)
  end
  
  test "should be valid" do
    assert @reaction.valid?
  end

  test "should require a user_id" do
    @reaction.user_id = nil
    assert_not @reaction.valid?
  end

  test "should require a micropost_id" do
    @reaction.micropost_id = nil
    assert_not @reaction.valid?
  end
  
  test "should react and un_react a micropost" do
    michael = users(:michael)
    ants  = microposts(:ants)
    assert michael.reacting?(ants)
    michael.un_react(ants)
    assert_not michael.reacting?(ants)
    michael.react(ants)
    assert michael.reacting?(ants)
  end
  
  

end
