require 'rails_helper'

describe 'user edits an article' do
  describe 'they link from the show page' do
    describe 'they fill in an edit field' do
      it 'displays the updated information on a show page' do
        article_1 = Article.create(title: "Article 1 Title", body: "Article 1 Body")
        article_2 = Article.create(title: "Article 2 Title", body: "Article 2 Body")

        visit article_path(article_1)

        click_link 'Edit'

        expect(current_path).to eq(edit_article_path(article_1))
        fill_in "article[title]", with: "New Title"
        fill_in "article[body]", with: "New Body"

        click_on 'Update Article'
        expect(page).to have_content("Article 'New Title' Updated!")
        expect(current_path).to eq(article_path(article_1))
        expect(page).to have_content("New Title")
        expect(page).to have_content("New Body")
      end
    end
  end
end
