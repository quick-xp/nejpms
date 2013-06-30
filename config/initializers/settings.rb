# coding: utf-8

class Settings < Settingslogic
  source "#{Rails.root}/config/eve.yml"
  namespace Rails.env
end
