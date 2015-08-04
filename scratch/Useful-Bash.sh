ogr2ogr -f GeoJSON subunitsD.json IND_adm2.shp
topojson -o in-2001.json --id-property NAME_2 --properties state=NAME_1 -- subunitsD.json
awk -F',' '{print $3","}' List_of_Districts.txt|sort > SortedDISTS
cat in-2001.json|  python -m json.tool |grep -i ID |sort |sed s/".*\"id\": "//g > DistrictsInJSON
