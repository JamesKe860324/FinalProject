from os import read
import zipfile
# 合併一個檔案
# x = zipfile.ZipFile('realEstate\download.zip', 'r')
# targetFileName = x.namelist()[6]
# content = x.read(targetFileName)
# with open('D:\JamesKe\Program\期末專題\千禧世代租住房選擇\\realEstate\\realEstate.csv', 'wb') as f:
#     f.write(content)
#     for i in range(2,38) :
#         z = zipfile.ZipFile(f'realEstate\download ({i}).zip', 'r')
#         targetFileName = z.namelist()[6]
#         content = z.read(targetFileName)
#         with open(f'D:\JamesKe\Program\期末專題\千禧世代租住房選擇\\realEstate\\realEstate.csv', 'ab') as f:
#             f.write(content)

# 存成各個檔案
x = zipfile.ZipFile('realEstate\download.zip', 'r')
targetFileName = x.namelist()[6]
content = x.read(targetFileName)
with open('D:\JamesKe\Program\期末專題\千禧世代租住房選擇\\realEstate\\realEstate_1.csv', 'wb') as f:
    f.write(content)
    for i in range(2,39) :
        z = zipfile.ZipFile(f'realEstate\download ({i-1}).zip', 'r')
        targetFileName = z.namelist()[6]
        content = z.read(targetFileName)
        with open(f'D:\JamesKe\Program\期末專題\千禧世代租住房選擇\\realEstate\\realEstate_{i}.csv', 'ab') as f:
            f.write(content)
