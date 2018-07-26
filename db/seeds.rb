require 'faker'

10.times do |assembly|
  assembly = Assembly.create(name: Faker::ElectricalComponents.electromechanical)
end

10.times do |part|
  part = Part.create(part_number: rand(1..1000))
end

Part.all.each do |part|
  part.assemblies.push(Assembly.all.sample)
  part.save
end

Assembly.all.each do |assembly|
  assembly.parts.push(Part.all.sample)
  assembly.save
end
