class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [ :home ]
  skip_before_action :verify_authenticity_token

  def home
  end
  def contact_send
    contact = params[:contact_mail]
    if contact[:rgpd] == "positive"
      contact[:rgpd] = "oui"
    else
      contact[:rgpd] = "non"
    end
    datecommande = Time.now
  
    ContactMailer.with(prenom:contact[:prenom],nom:contact[:nom],email:contact[:email],message:contact[:message],tel:contact[:tel],date_commande: datecommande, date_reception: contact[:day], qty: contact[:quantite], montant: contact[:montant] ,rgpd: contact[:rgpd]).new_contact_email.deliver_later
    flash[:notice] = "Votre mail a été envoyé avec succès"
    redirect_to root_path 
  end
end
