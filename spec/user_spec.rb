require "spec_helper"
describe User do
  it "should return 'leader, registrar' when an event is created" do
    user = Factory :user
    event = Factory( :event, :event_name => "Lots of Fun", :registrar_id => user.id)
    registration = Factory(:registration, :user_id => user.id, :event_id => event.id, :register_status => :leader)
    user.compound_status(event).should == "leader, registrar"
  end


end
