require "meta_cell"

describe CellDataItem do

  before(:each) do
    @cdi = CellDataItem.new(1, 1, "Testing string", :string)
  end

  it "[get_value] must return string if string is stored" do
    @cdi.get_value.should == "Testing string"
  end

  it "[item_type] must be :string when string value is assigned" do
    @cdi.type.should be :string # ===
  end

  it "[set_value] must change item value properly" do
    @cdi.set_value("some value1", :string)
    @cdi.get_value.should == "some value1"
    @cdi.type.should be :string
    @cdi.set_value("some value2", :text)
    @cdi.get_value.should == "some value2"
    @cdi.type.should be :text
    @cdi.type.should_not be :string
  end

end
