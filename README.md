## ابزار افزایش سرعت و امنیت سرور و تانل

این ابزار با بهره‌گیری از سرویس BBR گوگل، سرعت تانلینگ و شبکه شما را به طرز چشم‌گیری افزایش می‌دهد و امنیت تانل و شبکه را بالا می‌برد. علاوه بر این، کارهای زیر را انجام می‌دهد:

- اجرای سرویس BBR گوگل برای تانل و کل سرور های شما
- کامل کردن سورس لیست و متصل کردن مخازن اصلی اوبونتو، تا اروری برای دریافت بسته‌ها دریافت نشود
- تغییر دائمی dns
- برطرف کردن مشکل پاک شدن dns در سرور و بازگشت به حالت اولیه در برخی سرورها
### حتما با سوپر یوزر root اجرا شود
## قابل اجرا در اوبونتو 18 به بالا
```sh
sh -c 'echo "echo "nameserver 8.8.8.8" > /etc/resolv.conf"' && wget https://github.com/m-mjd/faster/raw/main/install.sh -O - | bash

```

## حذف نصب
```sh
wget https://github.com/m-mjd/faster/raw/main/remove.sh -O - | bash

```

## حمایت از ما
شما می‌توانید از ما با ستاره حمایت کنید:
با تشکر از حمایت شما.
