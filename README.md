# calibre-web


## Deploy
1. Run: `sh deploy.sh`

## Give permissions to /uploads
2. Run:
`docker exec -it calibre bash`
`chown -R kasm-user:kasm-user /uploads`
`ls -lart /uploads`
`exit`

## Note:
Default user:password for calibre is
admin:admin123

## Change password (if needed)
3. Run:
```
docker exec -it calibre-web bash
cd /app/calibre-web
python3 cps.py -s admin:Calibre2023! -p app.db
  Password for user 'admin' changed
```
