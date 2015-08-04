require 'rails_helper'

RSpec.describe CommentsController do
  def comment_params
    {
      content: 'This is linkbait.'
    }
  end

  describe 'GET show' do
    before(:each) do
      allow(Comment).to receive(:find) { double(Comment) }

      get :show, id: 0
    end

    it 'is successful' do
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      comment_response = JSON.parse(response.body)
      expect(comment_response).not_to be_nil
    end
  end

  describe 'PATCH update' do
    def comment_diff
      { content: 'First! ZOMGWTFBBQ' }
    end

    before(:each) do
      comment = double(Comment)
      allow(Comment).to receive(:find) { comment }
      allow(comment).to receive(:update) { true }

      patch :update, id: 0, comment: comment_diff, format: :json
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'renders a JSON response' do
      comment_response = JSON.parse(response.body)
      expect(comment_response).not_to be_nil
    end
  end

  describe 'DELETE destroy' do
    it 'is successful and returns an empty response' do
      comment = double(Comment)
      allow(Comment).to receive(:find) { comment }
      allow(comment).to receive(:destroy) { true }

      delete :destroy, id: 0, format: :json

      expect(response).to be_successful
      expect(response.body).to be_empty
    end
  end

end
