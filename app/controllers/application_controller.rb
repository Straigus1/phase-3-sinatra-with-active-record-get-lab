class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/bakeries' do 
    bakeries = Bakery.all 

    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])

    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    goodies = BakedGood.all.order(price: :desc)

    goodies.to_json

  end

  get '/baked_goods/most_expensive' do
    best_goodie = BakedGood.all.max_by {|price| price.price }

    best_goodie.to_json
  end

end
