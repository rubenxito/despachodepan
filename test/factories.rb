
Factory.define :card do |card|
  card.sequence(:title) {|n| "card-#{n}"}
end

Factory.define :selection do |selection|
  
end