# اپلیکیشن path_finder

## اپلیکیشنی مشابه با بازی Memory Path 

### ویژگی های کلیدی:

- ایجاد و استفاده از الگوریتم بهینه و پیشرفته برای پیاده سازی مراحل بازی
- اسفاده ازbloc برای state management و همچنین پیاده سازی bloc design pattern


### توضیحات بیشتر:
#### این اپلیکیشن بر پایه بازی memory path نوشته شده که در آن باید مسیر های نشان داده شده در هر مرحله را به خاطر سپرد و tile های درست را کلیک کرد.
#### علیرغم اینکه این اپ در اصل یک بازی میباشد اما بدون استفاده از موتور های بازی سازی نوشته شده از نوشتن الگوریتم تا state management اپلیکیشن تماما توسط توسعه دهنده این اپ نوشته شده.
#### در هر tile از یک bloc selector استفاده شده : به این دلیل که ما لیست tile های کلیک شده را در وضعیتمان داریم و با هر کلیک کردن چون وضعیت آپدیت میشود تمامی bloc builder ها مجدد ساخته میشوند پس برای جلوگیری از این مشکل و کند شدن برنامه ما از bloc selector استفاده که وضعیت آن از نوع Color میباشد استفاده کردیم تا فقط آن tile ای که کلیک میشود rebuild شود برای درک بهتر پیشنهاد میکنم به source code اپلیکیشن مراجعه کنید.


##### در ادامه چند screenshot از محیط برنامه به شما ارایه میشود:
![Screenshot_2025-03-09-17-44-09-327_com example path_finder](https://github.com/user-attachments/assets/78673923-629d-439d-9191-2edacb2088e3)
![Screenshot_2025-03-09-17-44-21-377_com example path_finder](https://github.com/user-attachments/assets/0e4c1696-836b-4e5e-a0d8-fcc862270cde)
![Screenshot_2025-03-09-17-44-57-795_com example path_finder](https://github.com/user-attachments/assets/456c9a84-e81c-4741-9f4a-a1099067034c)
![Screenshot_2025-03-09-17-45-14-108_com example path_finder](https://github.com/user-attachments/assets/f4959315-3919-4cff-82ad-8aaa43d25e58)




