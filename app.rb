require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/square/new") do
  
  erb(:square_new)

end

get("/square_root/new") do
  
  erb(:square_root_new)

end

get("/payment/new") do
  
  erb(:payment_new)

end

get("/random/new") do
  
  @outcome = rand(@min.to_i..@max.to_i)
  
  erb(:random_new)

end

get("/random/result") do
  

  min = params.fetch("min").to_f
  max = params.fetch("max").to_f
  result = rand(min..max)
  
  @outcome = "Minimum <br> #{min} <br> Maxium <br> #{max} <br> Random Number <br> #{result}"

  erb(:random_result)

end

get("/square/result") do
  
  number = params.fetch("number").to_f
  result = number ** 2
  
  @outcome = "Number <br> #{number} <br> Square <br> #{result}"

  erb(:square_result)

end

get("/square_root/result") do
  
  number = params.fetch("number").to_f
  result = Math.sqrt(number)
  
  @outcome = "Number <br> #{number} <br> Square Root<br> #{result}"

  erb(:square_root_result)

end

get("/payment/result") do
  
  APR = params.fetch("APR").to_f
  APR_print = APR.to_fs(:percentage, {:precision => 4})
  r = APR/100/12
  
  years = params.fetch("years").to_i
  n = years*12
 

  principal = params.fetch("principal").to_f
  principal_print = principal.to_fs(:currency)
  present_value = principal / ((1 + r) ** n)
  
  numerator = r * (1+r) ** n * principal
  denominator = (1+r) ** n - 1
  payment = numerator/denominator
  payment_print = payment.to_fs(:currency)


  @outcome = "APR <br> #{APR_print} <br> Number of years <br> #{years} <br> Principal <br> #{principal_print} <br> Payment <br> #{  payment_print = payment.to_fs(:currency)}"

  erb(:payment_result)

end
