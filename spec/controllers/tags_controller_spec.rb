require 'spec_helper'

describe TagsController do

  context 'GET #show' do
    before :each do
      FactoryGirl.create :post
      @post = FactoryGirl.create :post
      @tag = @post.tags.create(:cont => 'tag 1')
    end

    it 'render #show' do
      get :show, :id => @tag
      response.should render_template :show
    end

    it 'assigns the requested post to @post' do
      get :show, :id => @tag
      expect(assigns(:posts)).to  eq([@post])
    end

  end


end