from selenium import webdriver
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.common import by
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support.ui import Select
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
import json, pprint, time, os
from pathlib import Path
from time import sleep
import random

url = 'https://plvr.land.moi.gov.tw/DownloadOpenData'

listData = []

downloadPath = 'D:\JamesKe\Program\期末專題\千禧世代租住房選擇\\realEstate'

options = webdriver.ChromeOptions()
options.add_argument('--start-maximized')
options.add_argument('--incognito')
options.add_argument('--disable-popup-blocking')
options.add_experimental_option("prefs",{
    'download.default_directory' : downloadPath
})

driver = webdriver.Chrome(executable_path="D:\JamesKe\Program\網路爬蟲\chromedriver", options = options)

def visit() :
    driver.get(url)
    sleep(1)

def setDropDownMenu() :
    folderPath = Path("realEstate")
    folderPath.mkdir(exist_ok= True)

    driver.find_element(By.CSS_SELECTOR, 'li[tabindex = "-1"]').click()
    sleep(random.randint(1,3))
    for i in range(0,38) : 
        try : 
            WebDriverWait(driver, 10).until(
                EC.presence_of_element_located(
                    (By.CSS_SELECTOR, 'select#historySeason_id')
                )
            )
            selectDate = Select(driver.find_element(By.CSS_SELECTOR, 'select#historySeason_id'))
            sleep(random.randint(1,2))
            selectDate.select_by_index(i)
            sleep(random.randint(1,2))
            if i == 0 :
                selectFormat = Select(driver.find_element(By.CSS_SELECTOR, 'select#fileFormatId'))
                selectFormat.select_by_value('csv')
                DownloadType = driver.find_element(By.CSS_SELECTOR, 'input#downloadTypeId2').click()
                optionOne = driver.find_element(By.CSS_SELECTOR, 'input[value = "F_lvr_land_A"]').click()
            WebDriverWait(driver, 10).until(
                EC.presence_of_element_located(
                    (By.CSS_SELECTOR, 'input#downloadBtnId')
                )
            ).click()
            sleep(random.randint(3,4))
        except TimeoutException :
            print("等待逾時，即將關閉瀏覽器")
            sleep(3)
            driver.quit()

def close() :
    driver.quit()

if __name__ == "__main__" :
    visit()
    setDropDownMenu()
    close()