class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/bakeries' do
    "Hello World"
    bakeries = Bakery.all.order(:name)
    bakeries.to_json
  end

  get '/bakeries/:id' do
    "Hello World"
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end
  
  get '/baked_goods/by_price' do
    "Hello World"
    baked_goods = BakedGood.all.order(price: :desc)
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    "Hello World"
    baked_goods = BakedGood.all.order(price: :desc).first
    # baked_good = BakedGood.by_price.first
    baked_goods.to_json
  end

end
