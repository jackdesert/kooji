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

  it "should give me 'Monday Dec 31, 2011 - Monday Jan 1, 2012' if start year and end year differ" do
    a = Factory :event
    a.start_date = "2011-12-30"
    a.end_date = "2012-01-01"
    a.date_range.should == "Friday Dec 30, 2011 - Sunday Jan 1, 2012"
  end

end
