class Settings < Settingslogic
  source "#{Rails.root}/config/application.yml"
  suppress_errors Rails.env.production?
  load!
end