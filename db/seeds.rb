# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creando Facultades"
if true
  Faculty.create(name: "Facultad de Informática")
  Faculty.create(name: "Facultad de Arquitectura y Urbanismo")
  Faculty.create(name: "Facultad de Bellas Artes")
  Faculty.create(name: "Facultad de Cs. Agrarias y Forestales")
  Faculty.create(name: "Facultad de Cs. Astronómicas y Geofísicas")
  Faculty.create(name: "Facultad de Cs. Económicas")
  Faculty.create(name: "Facultad de Cs. Exactas")
  Faculty.create(name: "Facultad de Cs. Jurídicas y Sociales")
  Faculty.create(name: "Facultad de Cs. Médicas")
  Faculty.create(name: "Facultad de Cs. Naturales y Museo")
  Faculty.create(name: "Facultad de Cs. Veterinarias")
  Faculty.create(name: "Facultad de Humanidades y Cs. de la Educación")
  Faculty.create(name: "Facultad de Ingeniería")
  Faculty.create(name: "Facultad de Odontología")
  Faculty.create(name: "Facultad de Periodismo y Com. Social")
  Faculty.create(name: "Facultad de Psicología")
  Faculty.create(name: "Facultad de Trabajo Social")
  Faculty.create(name: "Escuela Universitaria de Recursos Humanos del Equipo de Salud")
end

puts "Creando Etiquetas"
if true
  Tag.create(name: "Programación")
  Tag.create(name: "Rails")
  Tag.create(name: "C")
  Tag.create(name: "Java")
  Tag.create(name: "Ruby")
  Tag.create(name: "Caballos")
  Tag.create(name: "Perros")
  Tag.create(name: "Gatos")
  Tag.create(name: "Reptiles")
  Tag.create(name: "Física")
  Tag.create(name: "Matemática")
  Tag.create(name: "Química")
  Tag.create(name: "Estadística")
  Tag.create(name: "Música")
  Tag.create(name: "Pintura")
  Tag.create(name: "Cine")
  Tag.create(name: "Fotografía")
  Tag.create(name: "Derecho Penal")
  Tag.create(name: "Derecho Civil")
  Tag.create(name: "Derecho Fiscal")
  Tag.create(name: "Derecho Administrativo")
  Tag.create(name: "Antropología")
  Tag.create(name: "Botánica")
  Tag.create(name: "Ecología")
  Tag.create(name: "Paleontología")
  Tag.create(name: "Zoología")
  Tag.create(name: "Geología")
end

puts "Creando Habilidades"
if true
  Skill.create(nombre: "Preguntar")
  Skill.create(nombre: "Responder")
  Skill.create(nombre: "Comentar")
  Skill.create(nombre: "Votar")
  Skill.create(nombre: "Editar etiquetas")
  Skill.create(nombre: "Editar facultades")
  Skill.create(nombre: "Editar permisos")
end

puts "Creando Admin"
  User.create(
    nombre: "Emir",
    apellido: "Fernandes",
    email: "emir.fernandes6@gmail.com",
    password: "123456789",
    password_confirmation: "123456789",
    faculty_id: 1)
