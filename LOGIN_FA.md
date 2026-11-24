# ورود به سامانه

## مشخصات ورود (یکسان برای محاسبه‌گر و پنل Node)

| | |
|--|--|
| **نام کاربری** | `kohanpour` |
| **رمز عبور** | `Bakery@1405` |

## محاسبه‌گر (`/calculator.html`)
ورود سمت مرورگر است. همین یوزر و رمز را وارد کنید.

## پنل اصلی (`/`)
در فایل `.env`:

```
ADMIN_USERNAME=kohanpour
ADMIN_INITIAL_PASSWORD=Bakery@1405
FORCE_ADMIN_PASSWORD_CHANGE=false
ADMIN_RESET_PASSWORD=true
```

اگر دیتابیس قدیمی با رمز دیگر ساخته شده:

```bash
rm -f data/*.sqlite
# سپس npm start یا systemctl restart
```
