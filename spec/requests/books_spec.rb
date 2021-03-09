require 'rails_helper'

RSpec.describe 'Books API', type: :request do
  # Initialize the test data
  let!(:author) { create(:author) }
  let!(:books) { create_list(:book, 20, author_id: author.id) }
  let(:author_id) { author.id }
  let(:id) { books.first.id }

  # Test suite for GET /authors/:author_id/books
  describe 'GET /authors/:author_id/books' do    
    before { get "/authors/#{author_id}/books" }

    context 'when author exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all todo books' do
        expect(json.size).to eq(20)
      end
    end

    context 'when author does not exist' do
      let(:author_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Author/)
      end
    end
  end

  # Test suite for GET /authors/:author_id/books/:id
  describe 'GET /authors/:author_id/books/:id' do
    before { get "/authors/#{author_id}/books/#{id}" }

    context 'when book exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the book' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when book does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Book/)
      end
    end
  end

  # Test suite for PUT /authors/:author_id/books
  describe 'POST /authors/:author_id/books' do
    let(:valid_attributes) { { title: 'Medo Líquido', description: 'Sociedade com medo líquido na era moderna' } }

    context 'when request attributes are valid' do
      before { post "/authors/#{author_id}/books", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/authors/#{author_id}/books", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  # Test suite for PUT /authors/:author_id/books/:id
  describe 'PUT /authors/:author_id/books/:id' do
    let(:valid_attributes) { { title: 'Medo Líquido', description: 'Sociedade com medo líquido na era moderna', author_id: author_id } }

    before { put "/authors/#{author_id}/books/#{id}", params: valid_attributes }

    context 'when book exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the book' do
        updated_book = Book.find(id)
        expect(updated_book.title).to match(/Medo Líquido/)
      end
    end

    context 'when the book does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Book/)
      end
    end
  end

  # Test suite for DELETE /authors/:id
  describe 'DELETE /authors/:id' do
    before { delete "/authors/#{author_id}/books/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end