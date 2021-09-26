import requests, time
from pathlib import Path
from pprint import pprint
import pandas as pd

listData = []

url = 'https://win.dgbas.gov.tw/fies/'

def getLinks() :
    for i in range(104,109) :
        listData.append({
            'fileName' : f"{i}_income",
            'fileLink' : f"{url}doc/result/{i}/a11/125.xls"
        })
    pprint(listData)

def downloadFile() :
    folderPath = Path('income_data')
    folderPath.mkdir(exist_ok= True)  # 移除用rmdir()
    # mkdir(parents = True, exist_ok = True)
    # exist_ok會忽略存在資料夾的錯誤

    for i in range(len(listData)) :
        fileLinkResponse = requests.get(listData[i]['fileLink'])
        with open(f"income_data/{listData[i]['fileName']}.xls",'wb') as f :
            f.write(fileLinkResponse.content)

def readFile() :
    pass
    

if __name__ == "__main__" : 
    getLinks()
    downloadFile()
    