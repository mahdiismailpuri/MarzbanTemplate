<div align="center">
  
# 🎄 قالب سابسکریپشن برای پنل مرزبان تم کریسمس



<p align="center">
  <a href="https://github.com/Troniza/MarzbanTemplate" target="_blank" rel="noopener noreferrer">
    <img src="https://raw.githubusercontent.com/Troniza/MarzbanTemplate/main/PreviewTemplate%400.5x.png" alt="Marzban-Sub Preview" width="800"/>
  </a>
</p>

[![GitHub Release](https://img.shields.io/github/v/release/Troniza/MarzbanTemplate?color=blue&style=for-the-badge&logo=github)](https://github.com/x0sina/marzban-sub/releases)
[![GitHub Stars](https://img.shields.io/github/stars/Troniza/MarzbanTemplate?color=yellow&style=for-the-badge&logo=github)](https://github.com/x0sina/marzban-sub/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/Troniza/MarzbanTemplate?color=green&style=for-the-badge&logo=github)](https://github.com/x0sina/marzban-sub/network)
[![GitHub Issues](https://img.shields.io/github/issues/Troniza/MarzbanTemplate?color=red&style=for-the-badge&logo=github)](https://github.com/x0sina/marzban-sub/issues)

<p align="center">
  <a href="#-persian">🇮🇷 فارسی</a> |
  <a href="#-english">🇺🇸 English</a> |
  <a href="#-russian">🇷🇺 Русский</a>
</p>

</div>

---

<div align="center">
  <h3>🌟 A Beautiful Subscription Management Template for Marzban Panel</h3>
  <p>Transform your Marzban panel into a modern, user-friendly interface</p>
</div>

---

<div dir="rtl">

# 🇮🇷 Persian

## ✨ ویژگی‌های برجسته
- 🎯 **رابط کاربری مدرن**
  - تم های مناسبتی با هر اپدیت
  - طراحی زیبا و چشم‌نواز
  - رابط کاربری واکنش‌گرا (Responsive)
  - انیمیشن‌های روان و جذاب
  
- 🌍 **چند زبانه**
  - پشتیبانی کامل از زبان فارسی
  - رابط انگلیسی برای کاربران بین‌المللی
  - پشتیبانی از زبان روسی

- 🛠️ **امکانات پیشرفته**
  ### ✨ ویژگی‌ها
- 🚀 افزودن سریع لینک سابسکریپشن به برنامه‌ها
- 📱 لینک دانلود اپلیکیشن‌های مورد نیاز
- 📋 دکمه کپی برای کانفیگ‌ها در انتهای صفحه

## ⚙️ نصب و راه‌اندازی

### 📥 دانلود و نصب

#### 🚩 برای نصب اول کامند زیر را اجرا کنید 

```bash
sudo wget https://raw.githubusercontent.com/Troniza/MarzbanTemplate/main/install.sh && chmod +x install.sh && sudo ./install.sh
```

# گزینه های منو 📱

1 - نصب تم
2 - دانلود تم
3 - بررسی نصب
4 - راه‌اندازی مجدد مرزبان
5 - حذف تم
6 - خروج


### 🎨 شخصی‌سازی

برای شخصی سازی ایدی تلگرام, تصویر پس زمینه و لوگوی کاربر باید تغییراتی در فایل html لحاظ شود که با سرچ کردن برخی مقادیر امکان پذیره.
برای سرچ کردن با استفاده از nano ابتدا فایل را با nano با دستور زیر باز کنید:
```
nano /var/lib/marzban/templates/subscription/index.html
```
سپس با دکمه های ترکیبی Ctrl + W سرچ بار رو باز کنید و برای عوض کردن ایدی پشتیبانی تلگرام عبارت زیر رو سرچ کنید:
```
https://t.me/yourID
```
برای لوگوی کاربر این عبارتو سرچ کنید:
```
images/marzban.svg
```
برای تصویر پس زمینه این عبارتو سرچ کنید:
```
background: url('https://4kwallpapers.com
```
پس از اعمال تغییرات فایل رو سیو کنید و مرزبان رو ریستارت کنید.


</div>

---

# 🇺🇸 English

## ✨ Key Features
- 🎯 **Modern UI/UX**
  - Beautiful and intuitive design
  - Fully responsive interface
  - Smooth animations
  
- 🌍 **Multi-language Support**
  - Complete Persian interface
  - English for international users
  - Russian language support

- 🛠️ **Advanced Features**
  - One-click config copying
  - Direct app download links
  - Easy subscription management

## ⚙️ Installation & Setup

### 📥 Download & Install
```bash
# Download template file
sudo wget -N -P /var/lib/marzban/templates/subscription/ https://raw.githubusercontent.com/x0sina/marzban-sub/main/index.html

# Set environment variables
sudo bash -c 'cat >> /opt/marzban/.env << EOL
CUSTOM_TEMPLATES_DIRECTORY="/var/lib/marzban/templates/"
SUBSCRIPTION_PAGE_TEMPLATE="subscription/index.html"
EOL'

# Restart service
marzban restart
```

### 🎨 Customization

<details>
<summary>Visual Settings</summary>

1. **Change Logo**
```html
<!-- Search for -->
images/marzban.svg
```

2. **Change Background**
```css
/* Search for */
background: url('...')
```

3. **Change Telegram Support ID**
```html
<!-- Search for -->
https://t.me/yourID
```
</details>

### 🌐 Host Version Setup
```php
// Edit in index.php
const BASE_URL = "https://your-panel-url:PORT";
```

---

# 🇷🇺 Russian

<details>
<summary>Click to expand Russian documentation</summary>

## ✨ Основные функции
- Современный пользовательский интерфейс
- Многоязычная поддержка
- Продвинутые функции управления

[Полная документация на русском языке скоро будет доступна]
</details>

---

<div align="center">

## 🤝 Contributing

We welcome contributions! Here's how you can help:
- 🐛 Report bugs
- 💡 Suggest new features
- 🔧 Submit pull requests

## 📝 License

This project is based on [Marzban Templates](https://github.com/Gozargah/Marzban) and is distributed under the MIT License.

## 💖 Support

If you find this project helpful, please consider giving it a star ⭐

<p align="center">Made with ❤️ for the Marzban Community</p>

</div>
