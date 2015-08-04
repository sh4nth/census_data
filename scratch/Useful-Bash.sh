awk -F',' '{print $3","}' List_of_Districts.txt|sort > SortedDISTS
cat in-2001.json|  python -m json.tool |grep -i ID |sort |sed s/".*\"id\": "//g > DistrictsInJSON

