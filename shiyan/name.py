#!/usr/bin/env python3
import matplotlib.pyplot as plt
import requests
import re

def pic( y ):
    plt.title("pie")
    lab=['rongyao','iphone','exp']
    plt.pie(y,labels=lab, autopct='%1.1f%%', startangle=150)
    plt.savefig("./picture/rongyao.jpg")
    plt.show()

def main():
    header = {
        "User-Agent": "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0",
    }
    lst = []
    x = [0]*4
    for i in range(1,20,2):
      url = "https://search.jd.com/Search?keyword=%E6%89%8B%E6%9C%BA&enc=utf-8&qrst=1&rt=1&stop=1&vt=2&suggest=2.his.0.0&page="+str(i)
      resp = requests.get(url, headers=header)
      data = resp.content.decode("utf-8")

      pattern = re.compile("""<div class="p-name p-name-type-2">
			<a target="_blank" title="(.*)" href="(.*?)" onclick""")
      ret = pattern.findall(data)
      for j in ret:
        lst.append(j[0])
        resObj = re.search(r'荣耀', j[0])
        if resObj:
            x[0]=x[0]+1
        resObj = re.search(r'iPhone', j[0])
        if resObj:
            x[1] = x[1] + 1
        resObj = re.search(r'iPhone', j[0])
        if resObj:
            x[1] = x[1] + 1
    x[2]=len(lst)-x[0]-x[1]
    pic(x)
    print(lst)
    print(x)
    print(len(lst))

if __name__ == "__main__":
    main()
