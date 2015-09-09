require 'rails_helper'

describe Foxynews::PresskitSetter do

  context '#all' do
    before do
      @presskits = Foxynews::PresskitSetter.all
    end

    it 'returns a collection of presskits' do
      expect(@presskits.data.class).to be(Array)
      expect(@presskits.data.first.class).to be(Foxynews::Presskit)
    end

    it 'returns a paging object' do
      expect(@presskits.paging.class).to be(Foxynews::Paging)
    end
  end

  context '#find' do
    it 'handles a bad url' do
      pk = Foxynews::PresskitSetter.find('abc')

      expect(pk).to eq(false)
    end

    it 'returns a presskit' do
      pk = Foxynews::PresskitSetter.find(215958)

      expect(pk.class).to be(Foxynews::Presskit)
      expect(pk.id).to eq(215958)
    end

    it 'handles nil' do
      pk = Foxynews::PresskitSetter.find(nil)

      expect(pk).to eq(false)
    end
  end
end
