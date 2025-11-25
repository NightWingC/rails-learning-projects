class ArticlesController < ApplicationController
    before_action :find_article, except: [ :new, :create, :index, :from_author ]
    before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]

    def index
       @articles = Article.all
    end

    def new
        @article = Article.new
        @article.title = "Demo"
        @categories = Category.all
    end

    def create
        # Antes de asignar un usuario
        # @article = Article.create(

        # Sin parametros fuertes  
        # @article = current_user.articles.create(
        #     title: params[:article][:title],
        #     content: params[:article][:content]
        # )

        @article = current_user.articles.create(article_params)
        @article.save_categories
        redirect_to @article

        # Devuelve un json
        # render json: @article
    end

    def show
    end

    def edit
        @categories = Category.all
    end

    def update
        # Con Strong params
        # @article.update(title: params[:article][:title], content: params[:article][:content])

        @article.update(article_params)
        @article.save_categories
        redirect_to @article
    end

    def destroy
        @article.destroy
        redirect_to root_path
    end


    def find_article
        @article = Article.find(params[:id])
    end

    def from_author
        # puts params[:user_id], "Aqui --------------------"
        @user = User.find(params[:user_id])
    end

    # Strong Params
    def article_params
        params.require(:article).permit(:title, :content, category_elements: [])
    end
end
