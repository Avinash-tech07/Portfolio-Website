# PG Life

Student PG search app (PHP, MySQL, Bootstrap, and a React listing view).

This is **not** a static site. It needs PHP and MySQL, so GitHub Pages / Netlify / Vercel will not run it as-is.

## Local setup (XAMPP)

1. Copy `.env.example` to `.env` and set your MySQL user and password.
2. Create a database named `pglife`.
3. Import `database/pglife.sql` in phpMyAdmin.
4. Place the project in `htdocs` (or point Apache at this folder).
5. Open `http://localhost/PGLife/`.

Demo logins use password `password`:

- `shadab@gmail.com`
- `aditya@gmail.com`
- `radhika@gmail.com`

## Local setup (Docker)

```bash
docker compose up --build
```

Then open `http://localhost:8080`.

## Deploy

Push this repo to GitHub, then pick one of these.

### Render / Railway / any Docker host

1. Create a MySQL database.
2. Import `database/pglife.sql`.
3. Deploy from the repo using the `Dockerfile`.
4. Set environment variables:

| Variable | Example |
| --- | --- |
| `DB_HOST` | your MySQL host |
| `DB_PORT` | `3306` |
| `DB_USER` | your MySQL user |
| `DB_PASSWORD` | your MySQL password |
| `DB_NAME` | `pglife` |

`DATABASE_URL` / `MYSQL_URL` (Railway, some add-ons) is also supported.

Railway maps `MYSQLHOST`, `MYSQLUSER`, `MYSQLPASSWORD`, `MYSQLDATABASE`, and `MYSQLPORT` automatically.

### cPanel / InfinityFree / shared hosting

1. Upload the project files (you can skip `react-app/` if you already have the built JS in `js/`).
2. Create a MySQL database in the host panel.
3. Import `database/pglife.sql`.
4. Add a `.env` file in the project root with the host’s DB credentials.
5. Point the domain document root at this folder.

## React listing page

`property_list.php` loads the compiled bundles in `js/`. After changing files under `react-app/src`, run:

```bash
cd react-app
npm install
npm run build
```

Then copy `react-app/build/static/js/*.chunk.js` into `js/` and update the script tags in `property_list.php` if the hashes changed.
