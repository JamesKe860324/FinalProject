import requests, csv
from bs4 import BeautifulSoup
from pprint import pprint
from pathlib import Path

listData = []

url = 'https://gas.qmap.tw/Taipei/'

def visit() :
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'lxml')
    elms = soup.select('div.table-responsive tr')
    for i in range(1,202):
        listDetails = []
        str = elms[i].text.strip().split('\n')
        for i in range(len(str)) :
            listDetails.append(str[i])
        listData.append(listDetails)

def writeToCSV() :
    with open('加油站/gas_station_original.csv', 'w', newline = '') as f :
        # 建立csv檔案寫入器
        writer = csv.writer(f)
        writer.writerows(listData)

if __name__ == "__main__" :
    visit()
    writeToCSV()