require 'rails_helper'

RSpec.describe AlbumsController, :type => :controller do
  let(:album1) { Album.create( name: 'Metamodern Sounds in Country Music', artist: 
                          'Sturgill Simpson', genre: 'Country', price: 8.95 ) }

  let(:album2) { Album.create( name: 'London Calling', artist: 'The Clash', genre: 
                            'Punk', price: 7.95 ) }


  describe 'GET #index' do 
    it 'renders index' do 
      get :index
      expect(response).to render_template(:index)
    end

    it 'populates an array of albums' do 
      get :index
      expect(assigns(:albums)).to eq([album1, album2])
    end
  end

  describe 'GET #show' do 
    it 'renders show' do 
      get :show, id: album1.id
      expect(response).to render_template(:show)
    end

    it 'assigns the correct album' do 
      get :show, id: album1.id
      expect(assigns(:album)).to eq(album1)
    end
  end

  describe 'GET #new' do 
    it 'renders new' do 
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new album' do 
      get :new
      expect(assigns(:album)).to be_a_new(Album)
    end
  end


  describe 'GET #edit' do
    let(:album_to_edit) { Album.create( name: 'Metamodern Sounds in Country Music', artist: 
                          'Sturgill Simpson', genre: 'Country', price: 8.95 ) }

    it 'renders edit' do 
      get :edit, id: album_to_edit.id
      expect(response).to render_template(:edit)
    end

    it 'assigns correct album' do 
      get :edit, id: album_to_edit.id
      expect(assigns(:album)).to eq(album_to_edit)
    end
  end

  describe 'POST #create' do 
    context 'valid attributes' do 
      let(:valid_attributes) { { name: 'Metamodern Sounds in Country Music', artist: 
                          'Sturgill Simpson', genre: 'Country', price: 8.95 } }

      it 'create a new album' do 
        expect{
          post :create, album: valid_attributes
        }.to change(Album, :count).by(1)
      end

      it 'redirect to albums#index' do 
        post :create, album: valid_attributes
        expect(response).to redirect_to(albums_path)
      end    
    end

    context 'invalid attributes' do
      let(:invalid_attributes) { { name: '' } }

      it 'does not create new album' do 
        expect{ 
          post :create, album: invalid_attributes
        }.to_not change(Album, :count)
      end

      it 're-renders new' do 
        post :create, album: invalid_attributes
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do 
    let(:album_to_edit) { Album.create( name: 'Metamodern Sounds in Country Music', artist: 
                          'Sturgill Simpson', genre: 'Country', price: 8.95 ) }
    
    context 'valid attributes' do 
      it 'updates album' do
        patch :update, id: album_to_edit.id, album: { name: 'Green Jello' }
        album_to_edit.reload
        expect(album_to_edit.name).to eq('Green Jello')
      end

      it 'redirects to albums#show' do 
        patch :update, id: album_to_edit.id, album: { name: 'Green Jello' }
        album_to_edit.reload
        expect(response).to redirect_to(album_path(album_to_edit.id))
      end
    end

    context 'invalid attributes' do 
      it 'does not update album' do 
        patch :update, id: album_to_edit.id, album: { name: '' }
        album_to_edit.reload
        expect(album_to_edit.name).to eq('Metamodern Sounds in Country Music')
      end

      it 're-renders edit' do 
        patch :update, id: album_to_edit.id, album: { name: '' }
        album_to_edit.reload
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do 
    it 'deletes album' do 
      album_to_remove = Album.create( name: 'Metamodern Sounds in Country Music', artist: 
                          'Sturgill Simpson', genre: 'Country', price: 8.95 )
      expect{
        delete :destroy, id: album_to_remove
      }.to change(Album, :count).by(-1)
    end

    it 'redirects to index' do 
      album_to_remove = Album.create( name: 'Metamodern Sounds in Country Music', artist: 
                          'Sturgill Simpson', genre: 'Country', price: 8.95 )
      delete :destroy, id: album_to_remove
      expect(response).to redirect_to(albums_path)
    end
  end
end


