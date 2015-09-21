require 'rails_helper'

describe Foxynews::PressroomSetter do

  describe "#pressroom" do
    it 'returns a pressroom object' do
      pressroom = Foxynews::PressroomSetter.pressroom

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

  describe ".filter_timeline_by_language!" do
    before do
      @timeline = Foxynews::PressroomSetter.timeline
      @timeline.filter_timeline_by_language!('de')
    end

    it 'returns only german results' do
      expect(@timeline.data['September 2015'].length).to eq(1)
      expect(@timeline.data['August 2015'].length).to eq(1)
      expect(@timeline.data['September 2015'].first.language).to eq('de')
    end
  end

  #TODO
  describe "#search" do
  end

end
