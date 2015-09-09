require 'rails_helper'

describe Foxynews::PressReleaseSetter do

  context '#all' do
    before do
      @press_release = Foxynews::PressReleaseSetter.all
    end

    it 'returns a collection of presskits' do
      expect(@press_release.class).to be(Foxynews::PressReleaseSetter)
      expect(@press_release.data.first.class).to be(Foxynews::PressRelease)
    end

    it 'returns a paging object' do
      expect(@press_release.paging.class).to be(Foxynews::Paging)
    end
  end

  context '#find' do
    it 'handles a bad url' do
      pk = Foxynews::PressReleaseSetter.find('abc')

      expect(pk).to eq(false)
    end

    it 'returns a presskit' do
      pk = Foxynews::PressReleaseSetter.find(109544)

      expect(pk.class).to be(Foxynews::PressRelease)
      expect(pk.id).to eq(109544)
    end

    it 'handles nil' do
      pk = Foxynews::PressReleaseSetter.find(nil)

      expect(pk).to eq(false)
    end
  end
end
