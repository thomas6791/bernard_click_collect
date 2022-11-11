class ContactMailer < ApplicationMailer
    default from: 'contact@bernardcook.fr'
    def new_contact_email
        @email = params[:email]
        @tel = params[:tel]
        @lastname = params[:lastname]
        @firstname = params[:firstname]
        @message = params[:message]
        @type_demande = params[:type_demande]
        @status = params[:status]
        @rgpd = params[:rgpd]
        @status = params[:status]
        mail(to: @email,reply_to: contact@bernardcook.fr, subject: "Votre commande en Click & Collect chez Bernard Cook")
    end
end
