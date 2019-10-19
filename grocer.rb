  require 'pry'
  
 def consolidate_cart(cart)
  final_hash = {}
  cart.each do |element_hash|
  element_name = element_hash.keys[0]
      
 if final_hash.has_key?(element_name)
    final_hash[element_name][:count] += 1
  else 
    final_hash[element_name] = {
    count: 1,
    price: element_hash[element_name][:price],
    clearance: element_hash[element_name][:clearance]
    }
  end
end
  final_hash
end
  
  def apply_coupons(cart, coupons)
    coupons.each do |coupon|
    item = coupon[:item]
    coupon_item = "#{item} W/COUPON"
  if cart.has_key?(item) 
  if cart[item][:count] >= coupon[:num]
  if !cart [coupon_item]
             cart[coupon_item] = {count: coupon[:num], price: coupon[:cost]/coupon[:num]}
          else
          cart[coupon_item][:count] += coupon[:num]
          end
      cart[item][:count] -= coupon[:num]
      end
     end
    end
   cart
  end 
  
  def apply_clearance(cart)
    cart.each do |product_name,stats|
      stats[:price] -= stats[:price] *0.2 if stats[:clearance]
   end 
      cart
  end
  
  def checkout(cart, coupons)
    hash_cart = consolidate_cart(array)
    applied_coupons = applied_coupons(hash_cart,coupons)
    applied_discount = apply_clearance(applied_coupons)
    total = applied_discount.reduce(0) { |acc,(key,value)|acc += value[:price] * value[:count]}
    total> 100 ? total * 0.9 : total
  end
  
  44444444
  def consolidate_cart(item)
  final = Hash.new 0 
  count = :count
item.each do |hash|
  hash.each do |food, description|
  
if final.has_key?(food) == false
  final[food] = description
  final[food][count] = 1
elsif final.has_key?(food)
final[food][:count] +=1
end
end
end
final
end

consolidate_cart(sample)



coupon = {:item => "AVOCADO", :num => 2, :cost => 5.0}

# def apply_coupons(cart, coupons)
#   final = Hash.new 0 
# coupons.each do |key, value|
#   puts key
#   cart.each do |food, description|
 
# end
# end

# end

# apply_coupons(consolidate_cart(sample), coupon)


# def apply_coupons(cart, coupon)
#   coupon.each do |item|
#     name_of_item = item[:item]
#     if cart.has_key?(name_of_item) == true && cart[name_of_item][:count] >= item[:num]
#       cart[name_of_item][:count] = cart[name_of_item][:count] - item[:num]
#       new_item = name_of_item + (" W/COUPON")
#       puts cart.has_key?(new_item)
#       if cart.has_key?(new_item) == false
#         cart[new_item] = {:price => item[:cost], :clearance => cart[name_of_item][:clearance], :count => 1}
#       else 
#         cart[new_item][:count] += 1
#       end
#     end
#   end
#   cart
# end
# apply_coupons(consolidate_cart(sample), coupon)



def apply_clearance(cart)

 
  cart.each do |item, details|
    if cart[item][:clearance] == true
      cart[item][:price] = (cart[item][:price]*0.20 - total)
    end
  end
  cart
end

apply_clearance(cart)

def apply_clearance(cart)
  # code here
  discount = 0.20
  cart.each do |item, details|
    if cart[item][:clearance] == true
      cart[item][:price] = (cart[item][:price]*discount).round(1)
    end
  end
  cart
end

def checkout(cart: [], coupons: [])
  # code here
  total = 0
  cart = consolidate_cart(cart)
  
  if cart.length == 1
    cart = apply_coupons(cart, coupons)
    cart_clearance = apply_clearance(cart)
    if cart_clearance.length > 1
      cart_clearance.each do |item, details|
        if details[:count] >=1
          total += (details[:price]*details[:count])
        end
      end
    else
      cart_clearance.each do |item, details|
        total += (details[:price]*details[:count])
      end
    end
  else
    cart = apply_coupons(cart, coupons)
    cart_clearance = apply_clearance(cart)
    cart_clearance.each do |item, details|
      total += (details[:price]*details[:count])
    end
  end
  

  if total > 100
    total = total*(0.90)
  end
  total


end
