require 'faker'
Faker::Config.locale = 'en-GB'

10.times do
    @client = Client.create(
        :name => Faker::Name.name,
        :contact_number => Faker::PhoneNumber.cell_phone,
        :address1 => Faker::Address.street_address,
        :address2 => "",
        :city => Faker::Address.city,
        :postcode => Faker::Address.postcode,
        :email => "",
        :add_info => ""
    )

    @client.email = Faker::Internet.email(name => @client.name)
    @client.save

end

Client.all.each do |client|
    10.times do 
        @case = client.cases.create(:status => "Open", :open_date => Time.now.strftime("%d/%m/%Y"))
        @case.save
    end
end


