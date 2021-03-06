require 'faker'
Faker::Config.locale = 'en-GB'

@user = User.create(:username => "edward", :password => "edward21")
@user.save

10.times do
    @client = @user.clients.create(
        :name => Faker::Name.name,
        :contact_number => Faker::PhoneNumber.cell_phone,
        :address1 => Faker::Address.street_address,
        :address2 => "",
        :city => Faker::Address.city,
        :postcode => Faker::Address.postcode,
        :email => Faker::Internet.email,
        :add_info => ""
    )


    @client.save

end

Client.all.each do |client|
    10.times do 
        @case = client.cases.create(:status => "Open", 
                                    :open_date => Time.now.strftime("%d/%m/%Y"),
                                    :owner => 1)
        @case.save
    end
end

Case.all.each do |kase|

    5.times do
        @note = kase.notes.create(:client_id => kase.client.id,
                                    :title => Faker::Book.title,
                                    :content => Faker::Shakespeare.hamlet[0],
                                    :owner => 1)
                                    
        @note.save
    end
end



