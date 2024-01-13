RSpec.describe Movie, type: :model do
  subject { FactoryBot.build(:movie) } # Assuming you have a FactoryBot factory for Movie

  describe 'validations' do
    it { should validate_presence_of(:title).with_message("can't be blank") }
    it { should validate_uniqueness_of(:title).case_insensitive.with_message("has already been taken") }
    it { should validate_presence_of(:overview).with_message("can't be blank") }
  end

  describe 'associations' do
    it { should have_many(:bookmarks).dependent(:restrict_with_exception) }
  end

  describe 'callbacks' do
    describe 'before_destroy' do
      context 'when movie has bookmarks' do
        it 'should not be able to destroy itself' do
          movie = FactoryBot.create(:movie_with_bookmarks) # Assuming you have a factory for a movie with bookmarks

          expect { movie.destroy }.to raise_error(ActiveRecord::DeleteRestrictionError)
        end
      end

      context 'when movie has no bookmarks' do
        it 'should be able to destroy itself' do
          movie = FactoryBot.create(:movie) # Assuming you have a factory for a movie without bookmarks

          expect { movie.destroy }.not_to raise_error
        end
      end
    end
  end
end
