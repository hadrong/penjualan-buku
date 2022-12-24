.model small
.code
org 100h
start:
	jmp mulai
	nama	db 13,10,'Nama pelanggan  : $'
	nim	    db 13,10,'Nomor antrian   : $'
    
                               
	tampung_nama db 30,?,30 dup(?)
	tampung_nim db 13,?,13 dup (?) 


daftar  db 13,10,'+..+......................................................|'
        db 13,10,'|..|          APLIKASI PENJUALAN BUKU FIKSI               |'
        db 13,10,'+..+......................................................|'
        db 13,10,'|No| DAFTAR BUKU NOVEL |  HARGA     |  METODE PEMBAYARAN  |'
        db 13,10,'+..+......................................................|'
        db 13,10,'|01|ANAK SEMUA BANGSA  |Rp.142.000  | COD                 |'
        db 13,10,'+..+......................................................|'
        db 13,10,'|02|BUMI MANUSIA       |Rp.138.000  | COD		         |'
        db 13,10,'+..+......................................................|'
        db 13,10,'|03|JEJAK LANGKAH      |Rp.143.000  | COD		         |'
        db 13,10,'+..+......................................................|'
        db 13,10,'|04|RUMAH KACA         |Rp.137.000  | COD                 |'
        db 13,10,'+..+......................................................|'
        db 13,10,'|05|SI PUTIH           |Rp.72.000   | COD                 |'
        db 13,10,'+..+......................................................|'

daftar2 db 13,10,'+..+......................................................|'
        db 13,10,'|No|DAFTAR BUKU CERPEN |  HARGA      |  METODE PEMBAYARAN |'
        db 13,10,'+..+......................................................|'
        db 13,10,'|06|TUKAR TAKDIR       |Rp.65.000    |  COD               |'
        db 13,10,'+..+......................................................|'
        db 13,10,'|07|KERETA TIDUR       |Rp.53.000    |  COD               |'
        db 13,10,'+..+......................................................|'
        db 13,10,'|08|DALAM GELAP        |Rp.89.500    |  COD               |'
        db 13,10,'+..+......................................................|'
        db 13,10,'|09|BIARKAN AKU MASUK  |Rp.66.000    |  COD               |'
        db 13,10,'+..+......................................................|'
        db 13,10,'|10|JANGAN PERGI       |Rp.76.000    |  COD               |'
        db 13,10,'+..+......................................................|','$'


lanjut  db 13,10,'LANJUT tekan y untuk lanjut >>>>>>>>>>>>>>> $'
eror    db 13,10,'KODE YANG ANDA MASUKKAN SALAH $'
pilihan db 13,10,'SILAHKAN MASUKKAN PILIHAN SESUAI ANGKA PADA TABLE YANG ANDA PILIH: $'

mulai:  

        mov ah,09h
        lea dx,nama
        int 21h
        mov ah,0ah
        lea dx,tampung_nama
        int 21h
        push dx

        mov ah,09h
        lea dx,nim
        int 21h
        mov ah,0ah
        lea dx,tampung_nim
        int 21h
        push dx

        mov ah,09h
        mov dx,offset daftar
        int 21h                                                            
        mov ah,09h
        mov dx,offset lanjut
        int 21h
        cmp al,'y'
        je page2
        jne eror_nsg

page2:
        mov ah,09h
        mov dx,offset daftar2
        int 21h
        mov ah,09h
        mov dx,offset lanjut
        int 21h
        cmp al,'y'
        jmp proses
        jne eror_nsg


eror_nsg:
        mov ah,09h
        mov dx,offset eror
        int 21h
        int 20

proses:
        mov ah,09h
        mov dx,offset pilihan
        int 21h
        mov ah,1
        int 21h
        mov bh,al
        mov ah,1
        int 21h
        mov bl,al
        cmp bh,'0'
        cmp bl,'1'
        je hasil1


        cmp bh,'0'
        cmp bl,'2'
        je hasil2


        cmp bh,'0'
        cmp bl,'3'
        je hasil3


        cmp bh,'0'
        cmp bl,'4'
        je hasil4


        cmp bh,'0'
        cmp bl,'5'
        je hasil5


        cmp bh,'0'
        cmp bl,'6'
        je hasil6


        cmp bh,'0'
        cmp bl,'7'
        je hasil7


        cmp bh,'0'
        cmp bl,'8'
        je hasil8


        cmp bh,'0'
        cmp bl,'9'
        je hasil9


        ;cmp bh,'1'
        ;cmp bl,'0'
        ;je hasil10
        
        
        jne eror_nsg
;......................................
hasil1:
        mov ah,09h
        lea dx,teks1
        int 21h
        int 20h
hasil2:
        mov ah,09h
        lea dx,teks2
        int 21h
        int 20h
hasil3:
        mov ah,09h
        lea dx,teks3
        int 21h
        int 20h
hasil4:
        mov ah,09h
        lea dx,teks4
        int 21h
        int 20h
hasil5:
        mov ah,09h
        lea dx,teks5
        int 21h
        int 20h
hasil6:
        mov ah,09h
        lea dx,teks6
        int 21h
        int 20h
hasil7:
        mov ah,09h
        lea dx,teks7
        int 21h
        int 20h
hasil8:
        mov ah,09h
        lea dx,teks8
        int 21h
        int 20h
hasil9:
        mov ah,09h
        lea dx,teks9
        int 21h
        int 20h
hasil10:
        mov ah,09h
        lea dx,teks10
        int 21h
        int 20h


;......................................
teks1   db 13,10,'ANDA MEMILIH  BUKU ANAK SEMUA BANGSA'
        db 13,10,'TOTAL HARGA YANG HARUS ANDA BAYAR:Rp.142.000'
        db 13,10,'TERIMAKASIH TELAH BERBELANJA DI TOKO KAMI$'

teks2   db 13,10,'ANDA MEMILIH BUKU BUMI MANUSIA'
        db 13,10,'TOTAL HARGA YANG HARUS ANDA BAYAR:Rp.138.000'
        db 13,10,'TERIMAKASIH TELAH BERBELANJA DI TOKO KAMI$'

teks3   db 13,10,'ANDA MEMILIH BUKU JEJAK LANGKAH'
        db 13,10,'TOTAL HARGA YANG HARUS ANDA BAYAR:Rp.143.000'
        db 13,10,'TERIMAKASIH TELAH BERBELANJA DI TOKO KAMI$'

teks4   db 13,10,'ANDA MEMILIH BUKU RUMAH KACA'
        db 13,10,'TOTAL HARGA YANG HARUS ANDA BAYAR:Rp.137.000'
        db 13,10,'TERIMAKASIH TELAH BERBELANJA DI TOKO KAMI$'

teks5   db 13,10,'ANDA MEMILIH BUKU SI PUTIH'
        db 13,10,'TOTAL HARGA YANG HARUS ANDA BAYAR:Rp.72.000'
        db 13,10,'TERIMAKASIH TELAH BERBELANJA DI TOKO KAMI$'

teks6   db 13,10,'ANDA MEMILIH BUKU TUKAR TAKDIR'
        db 13,10,'TOTAL HARGA YANG HARUS ANDA BAYAR:Rp.65.000'
        db 13,10,'TERIMAKASIH TELAH BERBELANJA DI TOKO KAMI$'

teks7   db 13,10,'ANDA MEMILIH BUKU KERETA TIDUR'
        db 13,10,'TOTAL HARGA YANG HARUS ANDA BAYAR:Rp.53.000'
        db 13,10,'TERIMAKASIH TELAH BERBELANJA DI TOKO KAMI$'

teks8   db 13,10,'ANDA MEMILIH BUKU DALAM GELAP'
        db 13,10,'TOTAL HARGA YANG HARUS ANDA BAYAR:Rp.89.500'
        db 13,10,'TERIMAKASIH TELAH BERBELANJA DI TOKO KAMI$'

teks9   db 13,10,'ANDA MEMILIH BUKU BIARKANAKU MASUK'
        db 13,10,'TOTAL HARGA YANG HARUS ANDA BAYAR:Rp.66.000'
        db 13,10,'TERIMAKASIH TELAH BERBELANJA DI TOKO KAMI$'

teks10  db 13,10,'ANDA MEMILIH BUKU JANGAN PERGI'
        db 13,10,'TOTAL HARGA YANG HARUS ANDA BAYAR:Rp.76.000'
        db 13,10,'TERIMAKASIH TELAH BERBELANJA DI TOKO KAMI$'
        

end start























