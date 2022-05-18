require 'rails_helper'

RSpec.describe "Manage posts function", type: :system do
	let(:user_a) { FactoryBot.create(:user, email: "userA@gmail.com") }
    let(:user_b) { FactoryBot.create(:user, email: "userB@gmail.com") }
    let!(:post_a){ FactoryBot.create(:post, title: "hello1234", user: user_a)}
    #postA = FactoryBot.create(:post, title: "hehe1111", user: user_a)

	before do
		#driven_by(:selenium_chrome_headless)
		driven_by(:rack_test)

		# user_a = FactoryBot.create(:user)
		#FactoryBot.create(:post, title:"hello1234", user: user_a)
		visit root_path
		fill_in "Email", with: loginn_user.email
		fill_in "Password", with: loginn_user.password
		click_button "Log in"
	end

	shared_examples_for "Show posts of user A" do
		it {expect(page).to have_content("hello1234")}
	end


	describe "Show posts list" do
		context 'When user A login ' do
			let(:loginn_user) { user_a }

			it_behaves_like "Show posts of user A"
		end

		context "When user B login" do
			#click_button "Log out"
			let(:loginn_user) { user_b }

			it "Do not show posts of user A" do
				expect(page).to have_no_content("hello1234")
			end
		end
	end 	# describe "Show posts list"


	describe "show details of post" do
		context "When user A login" do
			let(:loginn_user) {user_a}

			before do
				#postA = FactoryBot.create(:post, title: "hehe1111", user: user_a)
				visit post_path(post_a)
			end

			it_behaves_like "Show posts of user A"
			
		end
	end

end