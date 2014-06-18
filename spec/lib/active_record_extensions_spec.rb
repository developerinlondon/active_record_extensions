require 'spec_helper'

describe ActiveRecordExtensions do
  it 'should contain VERSION' do
    expect(ActiveRecordExtensions::VERSION).not_to eq be_nil
  end
end
