# sql-server-base

## Build Image
```bash
cp ./secrets/mssql_password.txt.example ./secrets/mssql_password.txt
cp .env.example .env
docker compose build
```

## Build, Run & Stop Container
```bash
cp ./secrets/mssql_password.txt.example ./secrets/mssql_password.txt
cp .env.example .env

docker compose build
docker compose up -d

docker compose down -v
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.