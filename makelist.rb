#! ruby -Ks
# coding: utf-8

require 'csv'
require "open-uri"
require 'rexml/document'
require 'kconv'

CSV.foreach('2010estat.csv'){|row|
    num = row[1] 
    xml = open("http://statdb.nstac.go.jp/api/1.0b/app/getStatsData?appId=XXXXXXXXXX&statsDataId=0003038591&cdArea=#{num}&cdCat01=00710&cdCat04=000&cdCat05=000") {|f| f.read}
    doc = REXML::Document.new(xml)

    hash = Hash.new
       doc.elements.each('GET_STATS_DATA/STATISTICAL_DATA/CLASS_INF/CLASS_OBJ[7]/CLASS') do |element|
       hash = element.attributes
    end
    puts hash["name"] 


     #以下より各年齢ごとに、総人口、男女比をつくりループさせる
     #puts　doc.elements['GET_STATS_DATA/STATISTICAL_DATA/DATA_INF/VALUE[@cat02=000]']text
       CSV.open('list_of_population.csv','a') do |writer|  
             
      n = 1 
       if n < 24
         #age = doc.elements["GET_STATS_DATA/STATISTICAL_DATA/CLASS_INF/CLASS_OBJ[4]/CLASS[#{n}]"].attributes['name']
         num_all = doc.elements["GET_STATS_DATA/STATISTICAL_DATA/DATA_INF/VALUE[@cat02=000][#{n}]"].text
         num_men = doc.elements["GET_STATS_DATA/STATISTICAL_DATA/DATA_INF/VALUE[@cat02=001][#{n}]"].text
         num_women = doc.elements["GET_STATS_DATA/STATISTICAL_DATA/DATA_INF/VALUE[@cat02=002][#{n}]"].text
          if n == 1
             ary1 = [num,hash["name"],num_all,num_men,num_women]
                    
          elsif n < 23  
             ary#{n} = [num_men,num_women]
             ary1.concat(ary#{n})
          
          else 
             ary1.concat(ary#{n})
            writer << ary1
          end
       n += 1
       
    end
end
    
}

