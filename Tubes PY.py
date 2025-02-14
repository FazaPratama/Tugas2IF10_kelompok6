#Program Jasa Pengiriman Barang
#I.S.: Pengguna memilih menu yang ingin diakses
#F.S.: Menampilkan output sesuai pilihan pengguna

import os

class Paket:
    def __init__(self, pengirim, penerima, alamat, no_hp, jenis, berat, tanggal, estimasi):
        self.pengirim = pengirim
        self.penerima = penerima
        self.alamat = alamat
        self.no_hp = no_hp
        self.jenis = jenis
        self.berat = berat
        self.tanggal = tanggal
        self.estimasi = estimasi

daftar_paket = []

def tambah_paket(estimasi):
    print('| INPUT DATA YANG DIBUTUHKAN |')
    print()
    pengirim = input("Nama Pengirim: ")
    penerima = input("Nama Penerima: ")
    alamat = input("Alamat Tujuan: ")
    no_hp = input("Nomor HP: ")
    jenis = input("Jenis Barang: ")
    berat = float(input("Berat Barang (kg): "))
    tanggal = input("Tanggal Pengiriman (DD/MM/YYYY): ")
    paket_baru = Paket(pengirim, penerima, alamat, no_hp, jenis, berat, tanggal, estimasi)
    daftar_paket[len(daftar_paket):] = [paket_baru]
    print("\nPaket berhasil ditambahkan!\n")
    os.system('cls')

def tampilkan_paket():
    if not daftar_paket:
        print("\nTidak ada paket yang tersimpan.\n")
    else:
        for i in range(len(daftar_paket)):
            paket = daftar_paket[i]
            print(f"\n{i + 1}. Pengirim: {paket.pengirim} -> Penerima: {paket.penerima}")
            print(f"   Alamat: {paket.alamat} | Berat: {paket.berat} kg")
            print(f"   Tanggal Pengiriman: {paket.tanggal} | Estimasi Tiba: {paket.estimasi} hari")
            print("   -------------------")

def hapus_paket():
    tampilkan_paket()
    if daftar_paket:
        try:
            index = int(input("Masukkan nomor paket yang ingin dihapus: ")) - 1
            if 0 <= index < len(daftar_paket):
                daftar_paket[index:index+1] = []
                print("\nPaket berhasil dihapus!\n")
            else:
                print("\nNomor paket tidak valid!\n")
        except ValueError:
            print("\nMasukkan angka yang valid!\n")

def cari_paket():
    keyword = input("Masukkan nama pengirim atau penerima: ").lower()
    hasil = [paket for paket in daftar_paket if keyword in paket.pengirim.lower() or keyword in paket.penerima.lower()]
    if hasil:
        for paket in hasil:
            print(f"\nPengirim: {paket.pengirim} -> Penerima: {paket.penerima}")
            print(f"Alamat: {paket.alamat} | Berat: {paket.berat} kg")
            print(f"Tanggal Pengiriman: {paket.tanggal} | Estimasi Tiba: {paket.estimasi} hari")
            print("-------------------")
    else:
        print("\nPaket tidak ditemukan!\n")

def urutkan_paket():
    if not daftar_paket:
        print("\nTidak ada paket yang bisa diurutkan.\n")
        return
    print("\nUrutkan berdasarkan:")
    print("1. Berat (Ascending)")
    print("2. Berat (Descending)")
    print("3. Nama Pengirim (Ascending)")
    print("4. Nama Pengirim (Descending)")
    pilihan = input("Pilih metode pengurutan: ")
    if pilihan == "1":
        daftar_paket[:] = sorted(daftar_paket, key=lambda paket: paket.berat)
    elif pilihan == "2":
        daftar_paket[:] = sorted(daftar_paket, key=lambda paket: paket.berat, reverse=True)
    elif pilihan == "3":
        daftar_paket[:] = sorted(daftar_paket, key=lambda paket: paket.pengirim.lower())
    elif pilihan == "4":
        daftar_paket[:] = sorted(daftar_paket, key=lambda paket: paket.pengirim.lower(), reverse=True)
    else:
        print("\nPilihan tidak valid!\n")
        return
    print("\nPaket berhasil diurutkan!\n")

def hapus_semua_paket():
    daftar_paket[:] = []
    print("\nSemua paket telah dihapus!\n")

def main():
    while True:
        print("\n<< MENU JASA PENGIRIMAN >>")
        print()
        print("1. Booking (Dalam Pulau)")
        print("2. Booking (Luar Pulau)")
        print("3. Tampilkan Semua Paket")
        print("4. Hapus Paket")
        print("5. Cari Paket")
        print("6. Urutkan Paket")
        print("7. Hapus Semua Paket")
        print("8. Keluar")
        pilihan = input("Pilih menu: ")
        os.system('cls')
        
        if pilihan == "1":
            tambah_paket(2)
        elif pilihan == "2":
            tambah_paket(5)
        elif pilihan == "3":
            tampilkan_paket()
        elif pilihan == "4":
            hapus_paket()
        elif pilihan == "5":
            cari_paket()
        elif pilihan == "6":
            urutkan_paket()
        elif pilihan == "7":
            hapus_semua_paket()
        elif pilihan == "8":
            print("Terima kasih telah menggunakan layanan kami!")
            break
        else:
            print("Pilihan tidak valid! Silakan coba lagi.")

if __name__ == "__main__":
    main()
