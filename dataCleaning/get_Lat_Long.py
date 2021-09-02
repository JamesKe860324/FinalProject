# 測試中
from selenium import webdriver
from selenium.common.exceptions import TimeoutException
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
import json, pprint, time, os
from pathlib import Path
from time import sleep
import random

url = 'https://www.map.com.tw/'

options = webdriver.ChromeOptions()
options.add_argument('--start-maximized')
options.add_argument('--incognito')
options.add_argument('--disable-popup-blocking')
options.add_argument('headless')

# 可以取得coordinate的func
def get_Lat_Long(addr):
    driver = webdriver.Chrome(executable_path="D:\JamesKe\Program\網路爬蟲\chromedriver", options = options)
    driver.get("http://www.map.com.tw/")
    search = driver.find_element_by_id("searchWord")
    search.clear()
    search.send_keys(addr)
    driver.find_element_by_xpath("/html/body/form/div[10]/div[2]/img[2]").click() 
    sleep(1)
    iframe = driver.find_elements_by_tag_name("iframe")[1]
    driver.switch_to.frame(driver.find_element(By.CSS_SELECTOR, 'iframe.winfoIframe'))
    WebDriverWait(driver, 10).until(
        EC.presence_of_element_located(
            (By.CSS_SELECTOR, "td[onclick = 'showLocation()']")
        )
    ).click()
    coor = driver.find_element_by_xpath("/html/body/form/div[5]/table/tbody/tr[2]/td")
    coor = coor.text.strip().split(" ")
    lat = coor[-1].split("：")[-1]
    log = coor[0].split("：")[-1]
    return (lat, log)
    