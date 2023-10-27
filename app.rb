require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:layout)
end

get("/square/new") do
  erb(:layout)
end

get("/square/results") do
  @num = params.fetch("number").to_i
  @square = @num ** 2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_new)
end

get("/square_root/results") do
  @num = params.fetch("user_number").to_i
  @square_root = @num ** 0.5
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr = (params.fetch("user_apr")/100).to_fs(:percentafe)
  @years = params.fetch("user_years").to_i
  @pv = params.fetch("user_pv").to_fs(:currency)
  @numerator = @apv / 12 * @pv 
  @denominator = 1 - (1 + @apr / 12) ** (- 12 * @years)
  @payment = @numerator / @denominator
  erb(:payment_results)
end

get("/random/new") do
  erb(:random_new)
end

get("/random/results") do
  @min = params.fetch("user_min").to_i
  @max = params.fetch("user_max").to_i
  @out = rand(@min..@max)
  erb(:random_results)
end
