#! /usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'

def crypto_scrapper()

# NOM DE LA PAGE A SCANNER
doc = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))

# TABLEAU DES NOMS DES CRYPTOMONNAIES
  currencies_names = []
  doc.xpath('//tbody/tr/td[3]/div').each do |link|
    currencies_names << link.text
  end

# TABLEAU DES VALEURS DES CRYPTOMONNAIES
  values_array = []
  doc.xpath('//tbody/tr/td[5]/a').each do |link|
    values_array << link.text
  end

# CREATION DU HASH
  values_array = values_array.map{ |x| x.gsub(/[\s,]/ , "") }
  values_array = values_array.map{ |x| x.reverse.chop.reverse.to_f}
  result_hash = currencies_names.zip(values_array).to_h
  array_of_hashes = result_hash.each_slice(1).map &:to_h
  return array_of_hashes
end

print crypto_scrapper()

