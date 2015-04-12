## Making the list of the exact population

国勢調査から得られる人口等基本集計データを
次世代統計利用システム（API機能）から所得し
全国の市区町村ごとに、年齢別(5歳区切り)、性別にcsv化

### Requirements  
・ Ruby >= 1.8  
   open-uri  
   rexml/document  
   kconv  

政府統計データの WebAPI(eStat) を使うため、利用登録を行い、
アプリケーションIDを所得  
###### http://www.e-stat.go.jp/api/regist-login/

```
ex) appId=hogehoge
```
###  modified configuration

```
CSV.foreach('2010estat.csv'){|row|
    num = row[1] 
    xml = open("http://statdb.nstac.go.jp/api/1.0b/app/getStatsData?appId=hogehoge&cdArea=#{num}&cdCat01=00710&cdCat04=000&cdCat05=000") {|f| f.read}
    doc = REXML::Document.new(xml)
```
所得したアプリケーションIDを記載する

### Runing script
$ ruby makelist.rb

実行後リスト化された以下のファイルが作成される  
list_of_population.csv
