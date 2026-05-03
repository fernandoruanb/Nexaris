
## Database

The database used in this project is **PostgreSQL**.

### Access PostgreSQL

```bash
sudo -u postgres psql
````

### Create a Database

```sql
CREATE DATABASE portal;
```

Do not forget the semicolon `;`.

### Create a New User

```sql
CREATE USER fernando WITH PASSWORD '1234';
```

### Give Superuser Privileges

```sql
ALTER USER fernando WITH SUPERUSER;
```

Now the user has superuser privileges.

### List All Databases

```sql
\l
```

### Connect to a Database

```sql
\c discoveryportal
```

### List Tables

```sql
\dt
```

### Create a Table

```sql
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    year INT
);
```

### Check the Table List Again

```sql
\dt
```

### Show the Structure of a Table

```sql
\d books
```

### Insert Data into a Table

```sql
INSERT INTO books (title, author, year)
VALUES ('2222', 'test', 2022);
```

### Delete a Table

```sql
DROP TABLE IF EXISTS books;
```

### Leave the Current Database

You cannot delete a database while connected to it.

```sql
\c postgres
```

### Delete a Database

```sql
DROP DATABASE IF EXISTS DiscoveryPortal;
```



