#!/usr/bin/env python3
import matplotlib.pyplot as plt
import requests
import re

def pic( y ):
    x = [1000,2000,3000,4000,5000,6000,7000]
    print(x)
    print(y)
    fig = plt.figure()
    ax = fig.add_subplot(111)
    ax.set(xlim=[0, 6000], ylim=[0, 100], title='An Example Axes',ylabel='num', xlabel='price')
    plt.plot(x, y)
    plt.title("plot")
    plt.savefig("./picture/1.jpg")
    plt.show()

    plt.scatter(x, y)
    plt.title("scatter")
    plt.savefig("./picture/2.jpg")
    plt.show()

    plt.title("pie")
    lab=['0-1000','1000-2000','2000-3000','3000-4000','4000-5000','5000-6000','6000up']
    plt.pie(y,labels=lab, autopct='%1.1f%%', startangle=150)
    plt.savefig("./picture/3.jpg")
    plt.show()

    plt.boxplot(y, sym="o")
    plt.title("box")
    plt.savefig("./picture/4.jpg")
    plt.show()

def main():
    header = {
        "User-Agent": "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0",
    }
    lst = []
    x = [0]*7
    for i in range(1,20,2):
      url = "https://search.jd.com/Search?keyword=%E6%89%8B%E6%9C%BA&enc=utf-8&qrst=1&rt=1&stop=1&vt=2&suggest=2.his.0.0&page="+str(i)
      resp = requests.get(url, headers=header)
      data = resp.content.decode("utf-8")

      pattern = re.compile("""<strong class="J_\d+" data-done="1"><em>￥</em><i>(.*)</i></strong>""")
      ret = pattern.findall(data)
      for j in ret:
        lst.append(j)
        t=float(j)
        if t<1000:
            x[0]=x[0]+1
        elif t<2000:
            x[1]=x[1]+1
        elif t<3000:
            x[2]=x[2]+1
        elif t<4000:
            x[3]=x[3]+1
        elif t<5000:
            x[4]=x[4]+1
        elif t<6000:
            x[5]=x[5]+1
        else:
            x[6] = x[6] + 1
    pic(x)
    # web()

    print(lst)
    print(len(lst))

if __name__ == "__main__":
    main()
