require 'spec_helper'

describe Room do

  let (:room) do
    @room ||= Room.new
  end

  let (:complete_room) do
    @complete_room ||= Room.new(
      :name => 'bedroom'
    )
  end

  it { complete_room.should be_valid }

  it { should have(1).error_on :name }
  it { should have(0).lamps }  

end