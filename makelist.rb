#! ruby -Ks
# coding: utf-8

require 'csv'
require "open-uri"
require 'rexml/document'
require 'kconv'

CSV.foreach('2010estat.csv'){|row|
    num = row[1] 
    xml = open("http://statdb.nstac.go.jp/api/1.0b/app/getStatsData?appId=hogehoge&statsDataId=0003038591&cdArea=#{num}&cdCat01=00710&cdCat04=000&cdCat05=000") {|f| f.read}
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
       until n > 23
         #age = doc.elements["GET_STATS_DATA/STATISTICAL_DATA/CLASS_INF/CLASS_OBJ[4]/CLASS[#{n}]"].attributes['name']
         num_all = doc.elements["GET_STATS_DATA/STATISTICAL_DATA/DATA_INF/VALUE[@cat02=000][#{n}]"].text
         num_men = doc.elements["GET_STATS_DATA/STATISTICAL_DATA/DATA_INF/VALUE[@cat02=001][#{n}]"].text
         num_women = doc.elements["GET_STATS_DATA/STATISTICAL_DATA/DATA_INF/VALUE[@cat02=002][#{n}]"].text
 
        case n 
        when 1
       ary1 = [num,hash["name"].tosjis,num_all,num_men,num_women]    
        when 2
       ary2 = [num_men,num_women]
         ary1.concat(ary2)   
        when 3
       ary3 = [num_men,num_women]
         ary1.concat(ary3)       
        when 4
       ary4 = [num_men,num_women]
         ary1.concat(ary4)      
        when 5
       ary5 = [num_men,num_women] 
         ary1.concat(ary5)         
        when 6
       ary6 = [num_men,num_women]
         ary1.concat(ary6)         
        when 7
       ary7 = [num_men,num_women]
         ary1.concat(ary7)   
        when 8
       ary8 = [num_men,num_women]
         ary1.concat(ary8)
        when 9
       ary9 = [num_men,num_women]
         ary1.concat(ary9)    
        when 10
       ary10 = [num_men,num_women]
         ary1.concat(ary10)   
        when 11
       ary11 = [num_men,num_women]
         ary1.concat(ary11)         
        when 12
       ary12 = [num_men,num_women]
         ary1.concat(ary12)   
        when 13
       ary13 = [num_men,num_women]
         ary1.concat(ary13)
        when 14
       ary14 = [num_men,num_women]
         ary1.concat(ary14)    
        when 15
       ary15 = [num_men,num_women]
         ary1.concat(ary15)   
        when 16
       ary16 = [num_men,num_women]
         ary1.concat(ary16)         
        when 17
       ary17 = [num_men,num_women]
         ary1.concat(ary17)   
        when 18
       ary18 = [num_men,num_women]
         ary1.concat(ary18)
        when 19
       ary19 = [num_men,num_women]
         ary1.concat(ary19)    
        when 20
       ary20 = [num_men,num_women]
         ary1.concat(ary20)   
        when 21
       ary21 = [num_men,num_women]
         ary1.concat(ary21)
        when 22
       ary22 = [num_men,num_women]
         ary1.concat(ary22)   
        when 23
       ary23 = [num_men,num_women]
         ary1.concat(ary23)        
        
        writer << ary1
         end
          n += 1
       
       end


       end

}
      
 
