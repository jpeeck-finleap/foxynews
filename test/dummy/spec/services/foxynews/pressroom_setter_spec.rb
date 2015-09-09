require 'rails_helper'

describe Foxynews::PressroomSetter do

  describe "#my_pressroom" do
    it 'returns a pressroom object' do
      pressroom = Foxynews::PressroomSetter.my_pressroom

      expect(pressroom.class).to eq(Foxynews::Pressroom)
      expect(pressroom.id).to eq(60679)
    end
  end

  describe "#timeline" do
    before do
      @timeline = Foxynews::PressroomSetter.timeline
    end

    it 'returns a pressroom setter object' do
      expect(@timeline.class).to eq(Foxynews::PressroomSetter)
    end

    it 'returns an array of press releases and clippings grouped by month' do
      expect(@timeline.data['September 2015'].first.class).to eq(Foxynews::PressRelease)
      expect(@timeline.data['August 2015'].first.class).to eq(Foxynews::Clipping)
    end

    it 'returns paging information' do
      expect(@timeline.paging.class).to eq(Foxynews::Paging)
    end
  end

  #TODO
  describe "#search" do
  end

end
