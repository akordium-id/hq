# ☁️ Oracle Cloud Server Setup

Dokumen ini mencatat konfigurasi standar infrastruktur server Akordium Lab yang di-hosting di **Oracle Cloud Infrastructure (OCI)**.

## 1. Spesifikasi Server (Standar)
Kita memaksimalkan *Always Free Tier* yang sangat *powerful* dari Oracle, atau instance berbayar jika butuh upgrade.

* **Region:** (Isi Region Anda, misal: AP-SINGAPORE-1)
* **Shape:** `VM.Standard.A1.Flex` (ARM Processor)
* **OCPU:** 4 OCPU
* **RAM:** 24 GB
* **OS:** Ubuntu 22.04 LTS (Minimal)

## 2. Ingress Rules (Firewall)
Masalah paling umum di Oracle Cloud adalah port yang tertutup. Pastikan **Security List** di VCN (Virtual Cloud Network) mengizinkan port berikut:

| Port | Protocol | Kegunaan |
| :--- | :--- | :--- |
| `22` | TCP | SSH Access (Hanya izinkan IP Admin jika memungkinkan) |
| `80` | TCP | HTTP (Web Traffic) |
| `443` | TCP | HTTPS (Web Traffic - SSL) |
| `8000` | TCP | Coolify Dashboard (Akses Panel) |
| `6001` | TCP | (Opsional) Laravel Reverb / WebSockets |

*Catatan: Selain di Security List Oracle, port ini juga harus dibuka di `iptables` Ubuntu (biasanya ditangani otomatis oleh skrip instalasi Coolify, tapi jika gagal, cek di sini).*

## 3. Akses SSH
Akses root dimatikan demi keamanan. Gunakan user `ubuntu` dan SSH Key.

```bash
# Cara Login
ssh -i /path/to/your/private-key.key ubuntu@IP_PUBLIC_SERVER
