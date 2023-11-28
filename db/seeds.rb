puts 'Gerando multimeters...'

5.times do |i|
  Multimeter.create(
    mult_type: ["analogico", "digital"].sample ,
    description: ["tipo 1","tipo2"].sample
    )
end

puts 'multimeters gerados com sucesso!'