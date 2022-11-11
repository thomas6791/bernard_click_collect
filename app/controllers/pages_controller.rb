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
  
    ContactMailer.with(status:contact[:status],type_demande:contact[:demande],email: contact[:email], lastname: contact[:lastname], firstname: contact[:firstname], tel: contact[:tel], message: contact[:message], rgpd: contact[:rgpd]).new_contact_email.deliver_later
    flash[:notice] = "Votre mail a été envoyé avec succès"
    redirect_to root_path 
  end
end
