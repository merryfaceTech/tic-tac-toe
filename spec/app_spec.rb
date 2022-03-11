require "./App.rb"

  describe 'Game App' do
    it 'returns something' do
      expect(run()).not_to eq(nil)
    end
    
  describe 'Initiates grid do' do
    it 'returns something' do
      expect(app.initiate).to eq(nil)
    end
  end
end
