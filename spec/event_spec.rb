require "spec_helper"

describe Event do

  it "should give me 'Monday Jan 3, 2011' if there's only a start date" do
    a = Factory :event
    a.start_date = "2011-01-03"
    a.end_date = nil
    a.date_range.should == "Monday Jan 3, 2011"
    a.start_date = "2011-11-12"
    a.date_range.should == "Saturday Nov 12, 2011"
  end

  it "should give me 'Monday Jan 3 - Tuesday Jan 4, 2011' if start date and end date are in the same year" do
    a = Factory :event
    a.start_date = "2011-01-03"
    a.end_date = "2011-01-14"
    a.date_range.should == "Monday Jan 3 - Friday Jan 14, 2011"
  end
end
