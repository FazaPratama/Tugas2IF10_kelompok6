program JasaPengirimanBarang;
uses crt;

type
    Paket = record
        Pengirim, Penerima, Alamat, NoHP, Jenis, Tanggal: string;
        Berat: real;
        Estimasi: integer;
    end;

var
    daftarPaket: array[1..100] of Paket;
    jumlahPaket: integer;
    pilihan: integer;

procedure TambahPaket(estimasi: integer);
begin
    clrscr;
    if jumlahPaket < 100 then
    begin
        inc(jumlahPaket);
        writeln('Masukkan data paket:');
        write('Nama Pengirim: '); readln(daftarPaket[jumlahPaket].Pengirim);
        write('Nama Penerima: '); readln(daftarPaket[jumlahPaket].Penerima);
        write('Alamat Tujuan: '); readln(daftarPaket[jumlahPaket].Alamat);
        write('Nomor HP: '); readln(daftarPaket[jumlahPaket].NoHP);
        write('Jenis Barang: '); readln(daftarPaket[jumlahPaket].Jenis);
        write('Berat Barang (kg): '); readln(daftarPaket[jumlahPaket].Berat);
        write('Tanggal Pengiriman (DD/MM/YYYY): '); readln(daftarPaket[jumlahPaket].Tanggal);
        daftarPaket[jumlahPaket].Estimasi := estimasi;
        writeln('Paket berhasil ditambahkan!');
    end
    else
        writeln('Kapasitas penuh, tidak bisa menambah paket.');
    readln;
end;

procedure TampilkanPaket;
var
    i: integer;
begin
    clrscr;
    if jumlahPaket = 0 then
        writeln('Tidak ada paket yang tersimpan.')
    else
        for i := 1 to jumlahPaket do
        begin
            writeln(i, '. Pengirim: ', daftarPaket[i].Pengirim, ' -> Penerima: ', daftarPaket[i].Penerima);
            writeln('   Alamat: ', daftarPaket[i].Alamat, ' | Berat: ', daftarPaket[i].Berat:0:2, ' kg');
            writeln('   Tanggal Pengiriman: ', daftarPaket[i].Tanggal, ' | Estimasi: ', daftarPaket[i].Estimasi, ' hari');
            writeln('   -------------------');
        end;
    readln;
end;

procedure HapusPaket;
var
    index, i: integer;
begin
    clrscr;
    if jumlahPaket = 0 then
        writeln('Tidak ada paket untuk dihapus.')
    else
    begin
        TampilkanPaket;
        write('Masukkan nomor paket yang ingin dihapus: '); readln(index);
        if (index >= 1) and (index <= jumlahPaket) then
        begin
            for i := index to jumlahPaket - 1 do
                daftarPaket[i] := daftarPaket[i + 1];
            dec(jumlahPaket);
            writeln('Paket berhasil dihapus!');
        end
        else
            writeln('Nomor paket tidak valid!');
    end;
    readln;
end;

procedure HapusSemuaPaket;
begin
    clrscr;
    jumlahPaket := 0;
    writeln('Semua paket telah dihapus.');
    readln;
end;

procedure CariPaket;
var
    i: integer;
    keyword: string;
    ditemukan: boolean;
begin
    clrscr;
    write('Masukkan nama pengirim atau penerima: '); readln(keyword);
    ditemukan := false;
    for i := 1 to jumlahPaket do
    begin
        if (pos(lowercase(keyword), lowercase(daftarPaket[i].Pengirim)) > 0) or
           (pos(lowercase(keyword), lowercase(daftarPaket[i].Penerima)) > 0) then
        begin
            writeln('Pengirim: ', daftarPaket[i].Pengirim, ' -> Penerima: ', daftarPaket[i].Penerima);
            writeln('Alamat: ', daftarPaket[i].Alamat, ' | Berat: ', daftarPaket[i].Berat:0:2, ' kg');
            writeln('Tanggal Pengiriman: ', daftarPaket[i].Tanggal, ' | Estimasi: ', daftarPaket[i].Estimasi, ' hari');
            writeln('-------------------');
            ditemukan := true;
        end;
    end;
    if not ditemukan then
        writeln('Paket tidak ditemukan!');
    readln;
end;

procedure UrutkanPaket;
var
    i, j: integer;
    temp: Paket;
    pilihanUrut: integer;
begin
    clrscr;
    if jumlahPaket = 0 then
    begin
        writeln('Tidak ada paket yang bisa diurutkan.');
        readln;
        Exit;
    end;
    
    writeln('Urutkan berdasarkan:');
    writeln('1. Berat (Ascending)');
    writeln('2. Berat (Descending)');
    writeln('3. Nama Pengirim (Ascending)');
    writeln('4. Nama Pengirim (Descending)');
    write('Pilih metode urutan: '); readln(pilihanUrut);
    
    for i := 1 to jumlahPaket - 1 do
        for j := i + 1 to jumlahPaket do
        begin
            if (pilihanUrut = 1) and (daftarPaket[i].Berat > daftarPaket[j].Berat) or
               (pilihanUrut = 2) and (daftarPaket[i].Berat < daftarPaket[j].Berat) or
               (pilihanUrut = 3) and (daftarPaket[i].Pengirim > daftarPaket[j].Pengirim) or
               (pilihanUrut = 4) and (daftarPaket[i].Pengirim < daftarPaket[j].Pengirim) then
            begin
                temp := daftarPaket[i];
                daftarPaket[i] := daftarPaket[j];
                daftarPaket[j] := temp;
            end;
        end;
    
    writeln('Paket berhasil diurutkan!');
    readln;
end;

procedure MainMenu;
begin
    repeat
        clrscr;
        writeln('<< MENU JASA PENGIRIMAN >>');
        writeln('1. Booking (Dalam Pulau)');
        writeln('2. Booking (Luar Pulau)');
        writeln('3. Tampilkan Semua Paket');
        writeln('4. Hapus Paket');
        writeln('5. Cari Paket');
        writeln('6. Urutkan Paket');
        writeln('7. Hapus Semua Paket');
        writeln('8. Keluar');
        write('Pilih menu: '); readln(pilihan);

        case pilihan of
            1: TambahPaket(2);
            2: TambahPaket(5);
            3: TampilkanPaket;
            4: HapusPaket;
            5: CariPaket;
            6: UrutkanPaket;
            7: HapusSemuaPaket;
            8: writeln('Terima kasih telah menggunakan layanan kami!');
        else
            writeln('Pilihan tidak valid! Silakan coba lagi.');
        end;
        readln;
    until pilihan = 8;
end;

begin
    jumlahPaket := 0;
    MainMenu;
end.

