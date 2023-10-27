require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/square/new") do
  erb(:homepage)
end

get("/square/results") do
  @num = params.fetch("number").to_f
  @square = @num ** 2.to_f
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_new)
end

get("/square_root/results") do
  @num = params.fetch("user_number").to_f
  @square_root = @num ** 0.5.to_f
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  @years = params.fetch("user_years").to_i
  @pv = params.fetch("user_pv").to_i
  @numerator = @apr / 1200 * @pv
  @denominator = 1 - (1 + @apr / 1200) ** (- 12 * @years)
  @payment = @numerator / @denominator
  erb(:payment_results)
end

get("/random/new") do
  erb(:random_new)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f
  @out = rand(@min..@max)
  erb(:random_results)
end
