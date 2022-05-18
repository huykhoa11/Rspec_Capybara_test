require 'rails_helper'

RSpec.describe "Manage posts function", type: :system do
	describe "Show posts list" do
		let(:user_a) { FactoryBot.create(:user, email: "userA@gmail.com", password: "khoa1998") }
	    let(:user_b) { FactoryBot.create(:user, email: "userB@gmail.com", password: "khoa1998") }


		before do
			#driven_by(:selenium_chrome_headless)
			#driven_by(:rack_test)

			# user_a = FactoryBot.create(:user)
			FactoryBot.create(:post, title:"hello1234", user: user_a)
			visit root_path
			fill_in "Email", with: loginn_user.email
			fill_in "Password", with: loginn_user.password
			click_button "Log in"
		end

		context 'When user A login ' do
			let(:loginn_user) { user_a }

			it 'Show posts of user A' do
				expect(page).to have_content("hello1234")
			end
		end

		context "When user B login" do
			#click_button "Log out"
			let(:loginn_user) { user_b }

			it "Do not show posts of user A" do
				expect(page).to have_no_content("hello1234")
			end
		end

	end
end