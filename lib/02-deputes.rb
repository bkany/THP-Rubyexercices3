require 'rubygems'
require 'nokogiri'
require 'open-uri'

# RECUPERER L'ADRESSE EMAIL D'UN DEPUTE
def get_email(townhall_url)
  page = Nokogiri::HTML(URI.open(townhall_url))
  puts page.xpath('//a[contains(@href, "mailto")]')
#  return blabla
end

# RECUPERER LE PRENOM D'UN DEPUTE
def get_first_name(townhall_url)
  page = Nokogiri::HTML(URI.open(townhall_url))
  return blabla
end

# RECUPERER L'ADRESSE EMAIL D'UN DEPUTE
def get_last_name(townhall_url)
  page = Nokogiri::HTML(URI.open(townhall_url))
  return blabla
end

get_email('http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036')
