require 'rails_helper'

RSpec.describe 'Pressroom functionality' do

  #contact info
  address = 'pataphysics Pa Ubu 1-800-POLAND'
  main_website_url = 'www.example.com'
  company_blog_url = 'blog.example.com'
  contact_url = 'www.example.com/contact'

  #social media
  facebook_url = 'www.facebook.com/example'
  linkedin_url = 'linkedin.com/example/example'
  gplus_url = "google.com"

  published_date = '31 August, 2015'
  pr_title = 'Once more, dear Palcontents, once more!'
  pr_subtitle = 'Soon Ubu Roi shall be king of Poland anon!'
  pr_summary = 'my custom summary'
  pr_about = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'

  before do
    visit '/'
  end

  context 'sidebar' do

    describe 'displays the contact information' do
      it 'has an address' do
        expect(page).to have_content(address)
      end

      it 'has a website url' do
        expect(page.source).to match(main_website_url)
      end

      it 'has a company blog' do
        expect(page.source).to match(company_blog_url)
      end

      it 'has a contact url' do
        expect(page.source).to match(contact_url)
      end
    end

    describe 'displays the social media information' do
      it 'has a facebook url' do
        expect(page.source).to match(facebook_url)
      end
      it 'has a linkedin url' do
        expect(page.source).to match(linkedin_url)
      end
      it 'has a google plus url' do
        expect(page.source).to match(gplus_url)
      end
    end
  end

  context 'pressroom' do

    describe 'displays press releases' do
      it 'has a published date' do
        expect(page).to have_content(published_date)
      end
      it 'has a title' do
        expect(page).to have_content(pr_title)
      end
      it 'has a summary' do
        expect(page).to have_content(pr_summary)
      end

      it 'has an about' do
        expect(page).to have_content(pr_about)
      end
    end

    describe 'navigates to a press release page' do
      before do
        click_link "Once more, dear Palcontents, once more!", match: :first
      end

      it 'displays title' do
        expect(page).to have_content(pr_title)
      end

      it 'displays subtitle' do
        expect(page).to have_content(pr_subtitle)
      end

      it 'displays body' do
        expect(page).to have_content('This is a test press release')
      end
    end

  end

  context 'timeline' do
  end

end
