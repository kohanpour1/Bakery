# نصب روی VPS و پشتیبان‌گیری

## VPS
- Ubuntu/Debian توصیه می‌شود؛ Node.js 20/22 و Docker نصب کنید.
- پروژه را روی سرور کپی کنید یا از Git دریافت کنید.
- فایل `.env` بسازید و `SESSION_SECRET` را تصادفی/طولانی قرار دهید.
- با Docker: `docker compose up -d --build`.
- Nginx را Reverse Proxy کنید و TLS فعال کنید.
- پورت 3000 را عمومی نکنید؛ فقط روی localhost بماند.

## پشتیبان SQLite
فایل اصلی: `data/bakerytime.sqlite`. از SQLite Online Backup یا پس از توقف سرویس نسخه پشتیبان بگیرید. مثال ساده:

```bash
mkdir -p backups
sqlite3 data/bakerytime.sqlite ".backup 'backups/bakerytime-$(date +%F).sqlite'"
```

برای بازیابی، سرویس را متوقف و فایل پشتیبان معتبر را به مسیر `data/bakerytime.sqlite` بازگردانید. نسخه پشتیبان را خارج از همان سرور نگهداری کنید.

## یادداشت انتقال
- پوشه `data/` شامل اطلاعات کاربران، وظایف و سوابق است؛ آن را از دست ندهید.
- `SESSION_SECRET` جدید باعث بی‌اعتبار شدن نشست‌های قبلی می‌شود (رفتار امنیتی مطلوب پس از انتقال).
- پس از تغییر دامنه، HTTPS را بررسی کنید و ورود مدیر را آزمایش نمایید.
