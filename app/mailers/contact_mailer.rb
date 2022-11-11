class ContactMailer < ApplicationMailer
    default from: 'contact@bernardcook.fr'
    def new_contact_email
        @email = params[:email]
        @tel = params[:tel]
        @lastname = params[:nom]
        @firstname = params[:prenom]
        @message = params[:message]
        @commande_faite = params[:date_commande]
        @date_reception = params[:date_reception]
        @qty = params[:qty]
        @montant = params[:montant]
        #@type_demande = params[:type_demande]
        #@status = params[:status]
        @rgpd = params[:rgpd]
        #@status = params[:status]
        mail(to: [@email, 'contact@bernardcook.fr'],reply_to: 'contact@bernardcook.fr', subject: "Votre commande en Click & Collect chez Bernard Cook")
    end
end
