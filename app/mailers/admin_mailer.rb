class AdminMailer < ApplicationMailer
    def new_admin_email(admin)
      @admin = admin
      mail(to: @admin.email, subject: "Bienvenue dans notre application !")
    end
  end
  