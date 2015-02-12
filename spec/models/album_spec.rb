require 'rails_helper'

describe Album do 
  let(:album) { Album.new(name: 'Metamodern Sounds in Country Music', artist: 
                          'Sturgill Simpson', genre: 'Country', price: 8.95) }

  subject { album }

  it { should respond_to(:name) }
  it { should respond_to(:artist) }
  it { should respond_to(:genre) }
  it { should respond_to(:price) }

  it { should be_valid }

  describe 'validations' do 
    describe 'name' do 
      context 'is empty' do 
        before { album.name = ''}
        it { should_not be_valid }
      end

       context 'is too long' do 
        before { album.name = 'a' * 256 }
        it { should_not be_valid }
      end

       context 'is acceptable' do 
        before { album.name = 'Beef'}
        it { should be_valid }
      end
    end

    describe 'artist' do 
      context 'is empty' do 
        before { album.name = ''}
        it { should_not be_valid }
      end

      context 'is too long' do 
        before { album.artist = 'a' * 256 }
        it { should_not be_valid }
      end
    end

    describe 'genre' do 
      context 'is empty' do 
        before { album.name = ''}
        it { should_not be_valid }
      end

      context 'is too long' do 
        before { album.genre = 'a' * 256 }
        it { should_not be_valid }
      end

      context 'is too short' do 
        before { album.genre = 'a' * 2 }
        it { should_not be_valid }
      end
    end

    describe 'price' do 
       context 'is negative' do 
        before { album.price = -3 }
        it { should_not be_valid }
      end

      context 'is not a number' do 
        before { album.price = 'mookie' }
        it { should_not be_valid }
      end
    end
  end
end












