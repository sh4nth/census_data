import matplotlib.colors as c;
import sys

def dis(a,b):
    return (a[0]-b[0])**2 + (a[1]-b[1])**2 + (a[2]-b[2])**2

with open(sys.argv[1]) as f:
    color_list = f.read().splitlines()

sorted_list = []
current_color = color_list[0];

sorted_list.append(current_color)
color_list.remove(current_color)

n = len(color_list)
for i in xrange(n):
    new_color = min(color_list, key = lambda x: dis( c.colorConverter.to_rgb(current_color) , c.colorConverter.to_rgb(x)))
    sorted_list.append(new_color)
    color_list.remove(new_color)
    current_color=new_color

for color in sorted_list:
    print color

print " "
