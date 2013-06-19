require 'spec_helper'

describe 'Post on my blog', :js => true do

  before :each do
    @user = FactoryGirl.create(:user, :email => 'user@mail.com', :user_name => 'user', :password => '123456')
    @post = @user.posts.create(FactoryGirl.attributes_for(:post, :status => 1))
  end

  it 'go home' do
    visit posts_path
    expect(page).to have_content 'List of all posts on this site'
    expect(page).to have_content @post.body
  end

  it 'log in' do
    visit new_user_session_path
    within('#new_user') do
      fill_in 'user[email]', :with => 'user@mail.com'
      fill_in 'user[password]', :with => '123456'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully.'
    find('#msg-close').click

    visit new_post_path
    find_button('Create Post').click
    expect(page).to have_content 'Title is too short'
    find('#msg-close').click

    within('#new_post') do
      fill_in 'post[title]', :with => 'my post'
      fill_in 'post[body]', :with => 'My first post'
    end

    find_button('Create Post').click
    expect(page).to have_content 'Post was successfully created'
    find('#msg-close').click

    visit edit_post_path(@post)
    within('.edit_post') do
      fill_in 'post[title]', :with => 'my post change'
      fill_in 'post[body]', :with => 'My first post change'
    end
    find_button('Update Post').click
    expect(page).to have_content 'Post was successfully updated'
    find('#msg-close').click

  end

end