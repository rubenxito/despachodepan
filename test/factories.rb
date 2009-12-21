
Factory.define :card do |card|
  card.sequence(:title) {|n| "card-#{n}"}
end

Factory.define :slide do |slide|
  slide.body 'Slide body'
  slide.rol 'rol'
end