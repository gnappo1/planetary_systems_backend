class SystemsController < ApplicationController
  
  # GET: /systems
  get "/systems" do
    System.all.to_json(include: [:planets], except: [:created_at])
  end

  get "/systems/:id/planets" do
    system = find_system
    if system
      system.planets.to_json
    else
      halt 400, {message: "Could not find a system with id #{params["id"]}"}.to_json
    end
  end

  # POST: /systems
  post "/systems" do
    sys = System.create(name: params["name"])
    if sys.id
      halt 200, {system: system}.to_json
    else
      halt 400, {message: system.errors.full_messages.to_sentence}.to_json
    end
  end

  # GET: /systems/5
  get "/systems/:id" do
    system = find_system
    if system
      halt 200, {system: system}.to_json
    else
      halt 400, {message: "Cannot find System with id #{params[:id]}"}.to_json
    end
  end

  # PATCH: /systems/5
  patch "/systems/:id" do
    system = find_system
    if system.creator == @current_user && system.update(params)
      halt 200, {system: system}.to_json
    else
      halt 400, {message: system.errors.full_messages.to_sentence}.to_json
    end


  end

  # DELETE: /systems/5
  delete "/systems/:id" do
    system = find_system
    if system && system.creator == @current_user
      system.destroy
      halt 200, {message: "System successfully destroyed!"}.to_json
    else
      halt 400, {message: "Cannot find System with id #{params[:id]}"}.to_json
    end

  end

  private

  def find_system
    System.find_by(id: params["id"])
  end
end
