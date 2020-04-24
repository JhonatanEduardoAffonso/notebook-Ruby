namespace :utils do
  	desc "Populando Banco de Dados"
  	task seed: :environment do
  		100.times do |i|
			Contact.create!([
				{
					name: "Teste #{i}",
				 	email: "teste#{i}@teste.com",
				 	kind: Kind.all.sample,
				 	rmk: "Contatos teste"
				}
			])
		end
		puts "Contacts Gerados com Sucesso"
					
		Contact.all.each do |contact|
			Address.create!([
				{
					street: "Rua Teste #{contact}",
				 	city: "Cidade Teste #{contact}",
				 	state: "Estado Teste #{contact}",
				 	contact: contact
				}
			])
		end
		puts "Address Gerados com Sucesso"

		Contact.all.each do |contact|
			Random.rand(1..5).times do |i|
				Phone.create!([
					{
						phone: "11 99999-9999",
					 	contact: contact
					}
				])
			end
		end
		puts "Phone Gerados com Sucesso"
  	end
end
