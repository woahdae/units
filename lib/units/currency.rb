require 'units/base'
require 'soap/wsdlDriver'

class Numeric
  # Clear the cache so that any previous grabs of the currency do not appear
  def self.clear_currency_rates() @@currency_rates = Hash.new end
  # A cache of the currency conversion rates
  def self.currency_rates()       @@currency_rates            end
  
  private
  
  @@currency_rates      = Hash.new
  @@currency_converter  = SOAP::WSDLDriverFactory.new("http://www.xmethods.net/sd/2001/CurrencyExchangeService.wsdl").createDriver
  @@currency_countries  = { :euro => "euro", :brl =>"brazil", :frf =>"france", :marks =>"germany", :veb =>"venezuela", :jpy =>"japan", :dinars =>"tunisia", :kroner =>"norway", :bmd =>"bermuda", :eek =>"estonia", :jod =>"jordan", :shekels =>"israel", :idr =>"indonesia", :fim =>"finland", :sdd =>"sudan", :drachmae =>"greece", :esp =>"spain", :zlotych =>"poland", :markkaa =>"finland", :try =>"turkey", :rupiahs =>"indonesia", :cyp =>"cyprus", :pesetas =>"spain", :pte =>"portugal", :rubles =>"russia", :isk =>"iceland", :tnd =>"tunisia", :mxn =>"mexico", :lkr =>"sri lanka", :huf =>"hungary", :sgd =>"singapore", :dop =>"dominican republic", :fjd =>"fiji", :mur =>"mauritius", :php =>"philippines", :bbd =>"barbados", :gbp =>"united kingdom", :zmk =>"zambia", :vnd =>"vietnam", :iqd =>"iraq", :rupees =>"sri lanka", :shillings =>"kenya", :hrk =>"croatia", :bhd =>"bahrain", :nlg =>"netherlands", :schillings =>"austria", :sit =>"slovenia", :baht =>"thailand", :koruny =>"slovakia", :twd =>"taiwan", :aud =>"australia", :pkr =>"pakistan", :luf =>"luxembourg", :bef =>"belgium", :crc =>"costa rica", :bdt =>"bangladesh", :czk =>"czech republic", :iep =>"ireland", :qar =>"qatar", :cad =>"canada", :ats =>"austria", :all =>"albania", :lira =>"turkey", :kwd =>"kuwait", :riyals =>"saudi arabia", :rub =>"russia", :sar =>"saudi arabia", :kuna =>"croatia", :nok =>"norway", :usd =>"united states", :omr =>"oman", :enminbi =>"china", :grd =>"greece", :krooni =>"estonia", :taka =>"bangladesh", :lire =>"italy", :cny =>"china", :kes =>"kenya", :itl =>"italy", :dong =>"vietnam", :kronor =>"sweden", :pln =>"poland", :guilders =>"netherlands", :colones =>"costa rica", :inr =>"india", :clp =>"chile", :dem =>"germany", :tolars =>"slovenia", :hkd =>"hong kong", :myr =>"malaysia", :cop =>"colombia", :dkk =>"denmark", :sek =>"sweden", :rol =>"romania", :liri =>"malta", :pesos =>"mexico", :kwacha =>"zambia", :kronur =>"iceland", :mtl =>"malta", :ron =>"romania", :escudos =>"portugal", :dzd =>"algeria", :ars =>"argentina", :skk =>"slovakia", :bolivares =>"venezuela", :trl =>"turkey", :dollars =>"united states", :francs =>"switzerland", :afghanis =>"afghanistan", :lei =>"romania", :mad =>"morocco", :eur =>"euro", :ringgits =>"malaysia", :chf =>"switzerland", :egp =>"egypt", :leke =>"albania", :rials =>"oman", :ils =>"israel", :lbp =>"lebanon", :forint =>"hungary", :afa =>"afghanistan", :yen =>"japan", :reais =>"brazil", :thb =>"thailand" }
  
  add_unit_conversions  :currency => :lookup_currency
  add_unit_aliases      :currency => @@currency_countries.keys.inject({}) { |hash, value| hash.update value => [] }

  def lookup_currency(from, to)
    cache_key = :"#{from}_to_#{to}"
    @@currency_rates[cache_key] ||= @@currency_converter.getRate(@@currency_countries[from], @@currency_countries[to])
    return @@currency_rates[cache_key]
  end
  
  def lookup_currency_include?(unit)
    @@currency_countries.include? unit.to_s.downcase.intern
  end
end