# استقرار روی VPS (Ubuntu)

## سرور نمونه
- IP: 87.248.156.39
- SSH port: 9011

```bash
sudo apt update && sudo apt install -y nginx git
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs
sudo mkdir -p /var/www/bakerytime && sudo chown $USER:$USER /var/www/bakerytime
# extract package into /var/www/bakerytime
cd /var/www/bakerytime && cp .env.example .env && nano .env && npm install
npm start
```

Proxy Nginx to `127.0.0.1:3000`. See full notes in release ZIP.
