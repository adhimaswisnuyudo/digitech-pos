# Cashier Point of Sales (F&B)

Aplikasi **Point of Sales** mobile untuk bisnis makanan & minuman (kafe, restoran, warung). MVP fokus pada kasir cepat, kelola menu, struk, dan laporan harian — **offline-first** dengan **SQLite lokal**; integrasi **backend services** direncanakan setelah MVP.

## Dokumentasi

| Dokumen | Deskripsi |
|---------|-----------|
| [docs/PRD.md](docs/PRD.md) | Product Requirements Document (MVP v1.0) |
| [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) | Arsitektur teknis (Drift, lapisan, schema) |
| [docs/DESIGN.md](docs/DESIGN.md) | UI/UX, theme Material 3, wireframe & copy |
| [docs/TODO.md](docs/TODO.md) | Todo pengerjaan — **1 fase = 1 halaman** |

Baca PRD sebelum implementasi: user stories, acceptance criteria, model data, dan roadmap.

## Stack (MVP)

- **Flutter** — iOS & Android dari satu codebase
- **SQLite** — via **Drift** (persistensi transaksi, menu, settings)
- **Backend** — tidak ada di MVP; sync API di fase v2+ (lihat PRD §11)
- **Distribusi** — App Store / Google Play (fase rilis)

## Status proyek

- [x] PRD MVP (termasuk keputusan dine-in/takeaway, void transaksi, seeder demo)
- [x] Arsitektur & setup Flutter (`flutter create`, dependency Drift/Riverpod)
- [x] Design doc UI/UX ([DESIGN.md](docs/DESIGN.md))
- [x] Todo list implementasi ([TODO.md](docs/TODO.md))
- [x] Fase 3 — Daftar menu (+ foto produk)
- [x] Fase 5 — Kasir
- [ ] Fase 6 — Checkout ([TODO §6](docs/TODO.md#fase-6--checkout-bottom-sheet))

## Menjalankan app

```bash
cd /Users/adhimaswisnuyudo/projects/cashier_point_of_sales
flutter pub get
flutter run
```

Code generation Drift (nanti, setelah tabel didefinisikan):

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Ruang lingkup MVP (ringkas)

- Layar kasir, keranjang, **dine-in / takeaway**, pembayaran **tunai**
- CRUD menu & kategori + **seeder menu demo** (first install)
- Struk (tampil + bagikan)
- Laporan penjualan **hari ini** + **void transaksi**

Fitur di luar MVP (backend sync, QRIS, nomor meja, stok, dll.) tercantum di [§11 Roadmap](docs/PRD.md#11-roadmap-setelah-mvp) pada PRD.
