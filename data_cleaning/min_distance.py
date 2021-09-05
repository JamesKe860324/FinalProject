import math
from math import cos, asin, sqrt, pi
def getDistance(latA,lonA,latB,lonB):

    ra = 6378140 # 赤道半徑

    rb = 6356755 # 極   半徑

    flatten = (ra - rb) / ra # Partial rate of the earth

  # change angle to radians

    radLatA = math.radians(latA)

    radLonA = math.radians(lonA)

    radLatB = math.radians(latB)

    radLonB = math.radians(lonB)

    pA = math.atan(rb / ra * math.tan(radLatA))

    pB = math.atan(rb / ra * math.tan(radLatB))

    x = math.acos(math.sin(pA) * math.sin(pB) + math.cos(pA) * math.cos(pB) * math.cos(radLonA - radLonB))

    c1 = (math.sin(x) - x) * (math.sin(pA) + math.sin(pB)) ** 2 / math.cos(x / 2) ** 2

    c2 = (math.sin(x) + x) * (math.sin(pA) - math.sin(pB)) ** 2 / math.sin(x / 2) ** 2

    dr = flatten / 8 * (c1 - c2)

    distance = ra * (x + dr)

    distance = round(distance / 1000,4)

    return f'{distance}km'

print(getDistance(25.002893, 121.466101	, 24.929193, 121.371808))

# def LLs2Dist(lat1, lon1, lat2, lon2):
#     R = 6371
#     dLat = (lat2 - lat1) * math.pi / 180.0
#     dLon = (lon2 - lon1) * math.pi / 180.0

#     a = math.sin(dLat / 2) * math.sin(dLat / 2) + math.cos(lat1 * math.pi / 180.0) * math.cos(lat2 * math.pi / 180.0) * math.sin(dLon / 2) * math.sin(dLon / 2)
#     c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))
#     dist = R * c
#     return dist
# print(LLs2Dist(25.0056458, 121.4701595, 25.2195534, 121.628399))
 
# def distance(lat1, lon1, lat2, lon2):
#     p = pi/180
#     a = 0.5 - cos((lat2-lat1)*p)/2 + cos(lat1*p) * cos(lat2*p) * (1-cos((lon2-lon1)*p))/2
#     return 12742 * asin(sqrt(a))

# print(distance(25.0056458, 121.4701595, 25.2195534, 121.628399))
