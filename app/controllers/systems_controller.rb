class SystemsController < ApplicationController
  
  # GET: /systems
  get "/systems" do
    System.all.to_json#(include: [:planets], except: [:created_at])
  end

  get "/systems/:id/planets" do
    system = find_system
    # if system
    system.planets.to_json
    # else
    #   "Could not find a system with id #{params["id"]}"
    # end
  end

  # POST: /systems
  post "/systems" do
    sys = System.create(name: params["name"])
    binding.pry
    if sys.id
      sys.to_json
    else
      sys.errors.full_messages.to_sentence.to_json
    end
  end

  # GET: /systems/5
  get "/systems/:id" do
    system = find_system

  end

  # PATCH: /systems/5
  patch "/systems/:id" do
    system = find_system

  end

  # DELETE: /systems/5
  delete "/systems/:id" do
    system = find_system

  end

  private

  def find_system
    
    System.find_by(id: params["id"])
  end
end
