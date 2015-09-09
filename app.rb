class Candy < Sinatra::Base

  #General route actions
  get '/' do
    erb :home
  end

  get '/about' do
    erb :about
  end

  #RESTful Chocolate Controller Actions
  #index

  get '/chocolates' do
    @chocolates = Chocolate.all
    erb(:"chocolates/index")
  end

  #new
  get '/chocolates/new' do
    @chocolate = Chocolate.new
    erb(:"chocolates/new")
  end

  #create
  post '/chocolates' do
    @chocolate = Chocolate.new(params[:chocolate])
    if @chocolate.save
      redirect("/chocolates/#{@chocolate.id}")
    else
      erb(:"chocolates/new")
    end
  end

  #show
  get '/chocolates/:id' do
    @chocolate = Chocolate.find(params[:id])
    erb(:"chocolates/show")
  end

  #edit
  get '/chocolates/:id/edit' do
    @chocolate = Chocolate.find(params[:id])
    erb(:"chocolates/edit")
  end

  #update
  update '/chocolates/:id' do
    @chocolate = Chocolate.find(params[:id])
    if @chocolate.update_attributes(params[:chocolate])
      redirect("/chocolates/#{chocolate.id}")
    else
      erb(:"chocolates/edit")
    end
  end

  #delete
  delete '/chocolates/:id/delete' do
    @chocolate = Chocolate.find(params[:id])
    if @chocolate.destroy
      redirect('/chocolates')
    else
      redirect("/chocolates/#{@chocolate.id}")
    end
  end

end