require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))

deputy_url_selector = page.xpath('//*[@id="deputes-list"]/div/ul/li/a/@href')
deputy_url = []

deputy_name_selector = page.xpath('//*[@id="deputes-list"]/div/ul/li/a')
deputy_name = []
deputy_first_name = []
deputy_last_name = []

hash_par_depute_firstname = {}
hash_par_depute_lastname = {}


a = []


deputy_name_selector.each do |name|
    hash_par_depute = {}
    deputy_name << name.text
    deputy_first_name << name.text.split[1]
    deputy_last_name << name.text.split[2..-1].join(' ')

    hash_par_depute.store("first name", name.text.split[1])
    hash_par_depute.store("last name", name.text.split[2..-1].join(' '))
    
    deputy_url = name["href"]

    url_begin = "http://www2.assemblee-nationale.fr"
    page = Nokogiri::HTML(URI.open("#{url_begin + deputy_url}"))
    deputy_email = page.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[2]/a').text

    hash_par_depute.store("email", deputy_email)

    a << hash_par_depute

end
puts  a
         
