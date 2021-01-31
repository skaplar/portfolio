module Search
  class SearchArticle

    def initialize(params)
      @params = params
    end

    def find
      if(@params.has_key?(:query))
        query_param = @params[:query].downcase
        articles_titles = Article.all.where("lower(title) LIKE :query", query: "%#{query_param}%")
        articles_tags = Article.joins(:tags).where("lower(tags.name) = ?", query_param)
        tags = Tag.joins(:tag_aliases).where("lower(tag_aliases.alias) = ?", query_param)
        articles_aliases = Article.joins(:tags).where("tags.id = ?", tags.ids)
        return articles_titles + articles_tags + articles_aliases
      else
        return Article.all
      end
    end
  end
end
