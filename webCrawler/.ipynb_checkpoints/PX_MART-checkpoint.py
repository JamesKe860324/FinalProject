import requests, csv
from bs4 import BeautifulSoup
from pprint import pprint
from pathlib import Path

listData = []

url = 'http://www.wheresupermarket.com/shoplist/?comp=%E5%85%A8%E8%81%AF%E7%A6%8F%E5%88%A9%E4%B8%AD%E5%BF%83&city=%E6%96%B0%E5%8C%97%E5%B8%82%E9%96%80%E5%B8%82'

def visit() :
    response = requests.get(url)
    # response.status_code 確認網頁狀態
    response.encoding = 'utf-8'
    soup = BeautifulSoup(response.text, 'lxml')
    elms = soup.select("td.NormalText[valign = 'top'] tr")
    for i in range(3,112) :
        listDetails = [] # 為了製造兩層list
        str = elms[i].text.strip().split('\n') 
        if len(str) == 1 : # 讓中間沒有資料的tr排除掉
            continue
        for i in range(len(str)) : # str切割後會是list，用index來取
            listDetails.append(str[i])
        listData.append(listDetails)


def writeToCSV() :
    with open('全聯家樂福/PX_MART.csv', 'w', newline = '') as f :
        # 建立csv檔案寫入器
        writer = csv.writer(f)
        writer.writerows(listData)


if __name__ == "__main__" :
    visit()
    writeToCSV()