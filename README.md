
## ابزار بهبود سرعت و امنیت سرور و تانل

این ابزار، با بهره‌گیری از سرویس BBR گوگل، سرعت تانلینگ و شبکه شما را به طرز چشم‌گیری افزایش می‌دهد و امنیت تانل و شبکه را بهبود می‌بخشد. علاوه بر این، این ابزار کارهای زیر را انجام می‌دهد:

- اجرای سرویس BBR گوگل برای بهبود تانل و تمام سرورهای شما.
- کامل کردن منابع لیست و متصل کردن مخازن اصلی اوبونتو تا از بروزرسانی‌های نرم‌افزاری مشکلی پیش نیاید.
- تنظیم دائمی DNS.
- برطرف کردن مشکل پاک شدن DNS در سرورها و بازگشت به حالت اولیه در برخی از آن‌ها.

**توجه: لطفاً این ابزار را با دسترسی سوپر یوزر (root) اجرا کنید.**

### قابل اجرا در اوبونتو 18 و نسخه‌های بالاتر
<br>
<hr>
<br>

### نصب :

```sh
sh -c 'echo "nameserver 8.8.8.8" > /etc/resolv.conf' && wget https://github.com/m-mjd/faster/raw/main/install.sh -O - | bash
```

<hr>
<br>


### حذف نصب :

```sh
wget https://github.com/m-mjd/faster/raw/main/remove.sh -O - | bash
```

<br>
<hr>


## رفع مشکلات SSH

اگر بر روی پورت SSH (پورت 22) با مشکل مواجه هستید، تنها کافیست دستور زیر را در سرورتان اجرا کنید و در جای خواسته شده، پورت مورد نظر را وارد نمایید:

```sh
wget https://github.com/m-mjd/faster/raw/main/ssh/SSH.sh -O - | bash
```

<hr>
<br>


### بازگرداندن حالت اصلی SSH

```sh
wget https://github.com/m-mjd/faster/raw/main/ssh/remove.sh -O - | bash
```

---



## حمایت از ما

<hr>
<br>



### همچنین می‌توانید با دادن ⭐ (Star) ما را حمایت کنید.

