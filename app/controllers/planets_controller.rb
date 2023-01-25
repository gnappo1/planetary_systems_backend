class PlanetsController < ApplicationController
  
  # GET: /planets
  get "/planets" do
    Planet.all.to_json(include: [:system], except: [:created_at])
  end

  # POST: /planets
  post "/planets" do
    planet = Planet.create(name: params["name"])
    if planet.id
      halt 200, {planet: planet}.to_json
    else
      halt 400, {message: planet.errors.full_messages.to_sentence}.to_json
    end
  end

  # GET: /planets/5
  get "/planets/:id" do
    planet = find_planet
    if planet
      halt 200, {planet: planet}.to_json
    else
      halt 400, {message: "Cannot find Planet with id #{params[:id]}"}.to_json
    end
  end

  # PATCH: /planets/5
  patch "/planets/:id" do
    planet = find_planet
    if planet.creator == @current_user && planet.update(name: params[:name])
      halt 200, {planet: planet}.to_json
    else
      halt 400, {message: planet.errors.full_messages.to_sentence}.to_json
    end


  end

  # DELETE: /planets/5
  delete "/planets/:id" do
    planet = find_planet
    if planet&.creator == @current_user
      planet.destroy
      halt 200, {message: "Planet successfully destroyed!"}.to_json
    else
      halt 400, {message: "Cannot find Planet with id #{params[:id]}"}.to_json
    end

  end

  private

  def find_planet
    Planet.find_by(id: params["id"])
  end
end
