class Article < ApplicationRecord

new_article = Article.new(title: 'The meaning of life', content: "It's 42!")

new_article.valid?  # => should be `true`

new_article.save    # => should not display rollback warnings

Article.last        # => should be the one you just saved

end
