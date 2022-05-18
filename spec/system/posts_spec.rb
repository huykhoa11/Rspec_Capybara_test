require 'rails_helper'

RSpec.describe "Posts", type: :system do
  before do
    #driven_by(:selenium_chrome_headless)
    #driven_by(:rack_test)
    user_a = FactoryBot.create(:user)
    FactoryBot.create(:post, title:"hello1234", user: user_a)
  end

	context 'When user A login ' do
		before do
			visit root_path
			fill_in "Email", with: "huykhoa11@gmail.com"
			fill_in "Password", with: "khoa1998"
			click_button "Log in"
		end

		it 'Check the post title of user A' do
			expect(page).to have_content("hello1234")
		end

	end

end
