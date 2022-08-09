class ArticlesController < ApplicationController
    before_action :article_find, only: [:show,:edit,:update,:destroy]

    def show
    end

    def index
        @articles=Article.all
    end

    def new
        @article=Article.new
    end

    def edit
    end

    def create
        @article=Article.new(article_title_desc)
       if @article.save
        flash[:notice]="Article was created succesfully."
        redirect_to @article
       else
        render 'new'
       end
    end

    def update
       if @article.update(article_title_desc)
        flash[:notice]="Article was updated successfully."
        redirect_to @article
       else
        render 'edit' 
       end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
      end

    private

    def article_find
        @article = Article.find(params[:id])
    end

    def article_title_desc
        params.require(:article).permit(:title,:description)
    end

end