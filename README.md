# sql-server-2022-base

## Build Image
```bash
cp mssql_password.txt.example mssql_password.txt
docker build --secret id=mssql_password,src=./mssql_password.txt -t sql-server-2022:latest .
```

## Run / Stop Container
```bash
cp .env.example .env
docker compose up -d
docker compose down -v
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.