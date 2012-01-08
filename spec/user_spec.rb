require "spec_helper"
describe User do
  it "should return 'leader, registrar' when a user is both" do
    user = Factory :user
    event = Factory( :event, :event_name => "Lots of Fun", :registrar_id => user.id)
    registration = Factory(:registration, :user_id => user.id, :event_id => event.id, :register_status => :leader)
    user.compound_status(event).should == "leader, registrar"

  end

  it "should return 'leader' when user is a leader but not the registrar" do
    user = Factory :user
    event = Factory( :event, :event_name => "Lots of Fun", :registrar_id => user.id)
    registration = Factory(:registration, :user_id => user.id, :event_id => event.id, :register_status => :leader)
    event = Factory :event
    user.compound_status(event).should == "not registered"
  end

end
