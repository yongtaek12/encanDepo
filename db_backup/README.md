# Database Backup

Full dump of the `encanDepoDb` MariaDB database used by this project.

- File: `encanDepoDb.sql`
- Type: Schema + Data (mysqldump with `--add-drop-table`)
- Charset: utf8mb4
- Source: MariaDB 11.4 on Windows

## What is included

- All Django tables (auth_user, auth_group, django_session, django_migrations, etc.)
- `product_product` table with the 16 sample products
- The superuser account `laund` (password is hashed, you'll still need to know the original password to log in, or reset it after restore)

## How to restore on another PC

### 1. Prerequisites

- **MariaDB 10.x or 11.x** installed and running. Download: https://mariadb.org/download/
- During install, set the root password (remember it).
- Add `C:\Program Files\MariaDB <version>\bin\` to your PATH, or use full paths in the commands below.

### 2. Create the database and user

Open a terminal and connect as root:

```bash
mysql -u root -p
```

Then in the MariaDB prompt:

```sql
CREATE DATABASE encanDepoDb CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'user'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON encanDepoDb.* TO 'user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

> The username `user` and password `1234` match what's in `depo/settings.py`.
> If you change them, also update `settings.py` accordingly.

### 3. Import the dump

From the project root:

```bash
mysql -u user -p1234 encanDepoDb < db_backup/encanDepoDb.sql
```

Or on Windows PowerShell:

```powershell
Get-Content db_backup/encanDepoDb.sql | mysql -u user -p1234 encanDepoDb
```

### 4. Verify

```bash
mysql -u user -p1234 encanDepoDb -e "SELECT id, name, price FROM product_product;"
```

You should see 16 rows.

### 5. Run Django

```bash
cd <project root>
python -m venv .venv
.venv\Scripts\activate          # Windows
# source .venv/bin/activate     # macOS/Linux
pip install -r requirements.txt
python manage.py migrate        # should be a no-op if dump was complete
python manage.py runserver
```

Then open http://127.0.0.1:8000

### 6. Admin login

Username: `laund`

Original password is not in this repo. To reset:

```bash
python manage.py changepassword laund
```

Or create a new superuser:

```bash
python manage.py createsuperuser
```

## How to refresh this backup

When you change DB data and want to push an updated backup:

```bash
"C:\Program Files\MariaDB 11.4\bin\mysqldump.exe" -u user -p1234 --add-drop-table --routines --triggers --skip-comments --default-character-set=utf8mb4 encanDepoDb > db_backup/encanDepoDb.sql

git add db_backup/encanDepoDb.sql
git commit -m "Update DB backup"
git push
```
