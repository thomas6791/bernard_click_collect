class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end
  def contact_send
    contact = params[:contact_mail]
    if contact[:rgpd] == "positive"
      contact[:rgpd] = "oui"
    else
      contact[:rgpd] = "non"
    end
    fail
  
    ContactMailer.with(prenom:contact[:prenom],nom:contact[:nom],email: contact[:email],tel:contact[:tel],date_commande: Time.now, date_reception: contact[:day],rgpd: contact[:rgpd]).new_contact_email.deliver_later
    flash[:notice] = "Votre mail a été envoyé avec succès"
    redirect_to root_path 
  end
end
