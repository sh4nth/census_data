ogr2ogr -f GeoJSON subunitsD.json IND_adm2.shp
topojson -o in-2001.json --id-property NAME_2 --properties state=NAME_1 -- subunitsD.json
awk -F',' '{print $3","}' List_of_Districts.txt|sort > SortedDISTS
cat in-2001.json|  python -m json.tool |grep -i ID |sort |sed s/".*\"id\": "//g > DistrictsInJSON

# Take the list of languages and get the families from parsing wikipedia
awk '{print "echo \" title=\\\"-- "$1,$2"\\\"\"; curl https://en.wikipedia.org/wiki/"$2"_language 2>/dev/null | grep -A16 \"title=\\\"Language family\\\"\"; echo '--------------------------------'; "}' Languages.txt | bash | grep title= |sed 's/.*title=\"//g;'|sed 's/\".*$//g;' >> groupings

# Take the previous output and collect it in a sortable format
awk '{x = $1; if(x=="--"){print ">"z">,"code","lang; code=$2; lang=$3; z="";} else {z=z">"$0} }' groupings | sort >  Languages-by-family.txt

