module Search
  class SearchArticle

    def initialize(params)
      @params = params
    end

    def find
      if(@params.has_key?(:query))
        query_param = @params[:query].downcase
        return Article.all.where("lower(title) LIKE :query", query: query_param)
      else
        return Article.all
      end
    end
  end
end
