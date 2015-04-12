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
アプリケーションIDを所得。  
###### http://www.e-stat.go.jp/api/regist-login/

```
ex) appId=hogehoge
```
###  modified configuration



### Runing script
$ ruby makelist.rb

実行後リスト化された以下のファイルが作成される  
list_of_population.csv
