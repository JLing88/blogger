require 'rails_helper'

describe 'user deletes an article' do
  describe 'they link from the show page' do
    it 'displays all articles without the deleted article' do
      article_1 = Article.create(title: "Article 1 Title", body: "Article 1 Body")
      article_2 = Article.create(title: "Article 2 Title", body: "Article 2 Body")

      visit article_path(article_1)
      click_on("Delete")

      expect(page).to have_content("Article Deleted!")
      expect(current_path).to eq(articles_path)
      expect(page).to_not have_content(article_1.title)
      expect(page).to have_content(article_2.title)
    end
  end
end
