#  IMPORT LIBRARY 
import mysql.connector  # buat koneksi ke database MySQL
import re  # buat mendeteksi angka dari input user (regex)
import pandas as pd  # buat bantu manipulasi data
from sklearn.svm import SVC  # algoritma Support SVM buat klasifikasi
from sklearn.model_selection import train_test_split  # Library buat pisahin data latih dan data test
from sklearn.metrics import accuracy_score  # Library buat ngecek seberapa akurat model ML

#  KONEKSI MYSQL 
connect = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="travel_bot"
)
cursor = connect.cursor()  

# Ambil data dari tabel paket_wisata ke dalam bentuk dataframe
df = pd.read_sql("SELECT * FROM paket_wisata", connect)

# Fungsi buat menentukan kategori harga (murah/sedang/mahal)
def kategori(harga):
    if harga < 3000000:
        return 'murah'
    elif 3000000 <= harga <= 5000000:
        return 'sedang'
    else:
        return 'mahal'

# Tambahin kolom 'kategori' berdasarkan harga
# Ini jadi label yang akan dipelajari oleh model ML
df['kategori'] = df['harga'].apply(kategori)

# Data yang akan dilatih: harga -> fitur, kategori -> label
X = df[['harga']]
y = df['kategori']

# Split data menjadi 80% training dan 20% testing
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42, stratify=y  # stratify biar data tiap kategori seimbang
)

# Inisialisasi model SVM dengan kernel linear
model = SVC(kernel='linear')
model.fit(X_train, y_train)  # training model

# Prediksi hasil 
y_pred = model.predict(X_test)
accuracy = accuracy_score(y_test, y_pred)  # hitung akurasi model


# ================= CHATBOT =================
bot = False  # Status bot awalnya mati

print('''
    Bot Travel Siap Digunakan :D
    Ketik On/Off untuk mengaktifkan Bot/Mematikan bot
    Ketik /q untuk keluar
    Ketik /help untuk melihat daftar pertanyaan
''')

# Loop utama chatbot
while True:
    user_input = input("Anda : ").lower()  # Ambil input dari user dan ubah jadi huruf kecil semua

    # Fungsi ON
    if user_input == "on":
        if bot:
            print("Bot Sudah On")
        else:
            bot = True
            print("Bot Telah Diaktifkan")

    # Fungsi OFF
    elif user_input == "off":
        if bot:
            bot = False
            print("Bot Telah Dimatikan")
        else:
            print("Bot Sudah Mati")

    # Fungsi QUIT
    elif user_input == "/q":
        break 

    # Fungsi /HELP
    elif user_input == "/help":
        cursor.execute("SELECT pertanyaan FROM chatbot")
        daftar_pertanyaan = cursor.fetchall()
        if daftar_pertanyaan:
            print("Berikut Daftar Pertanyaan Yang Bisa Saya Jawab ^_^")
            for i, row in enumerate(daftar_pertanyaan, 1):
                print(f" {i}. {row[0]}")
        else:
            print("Belum ada pertanyaan yang tersedia di database.")

    # Kalau Bot Aktif
    elif bot:
        # Cek apakah input mengandung angka (anggap itu budget)
        temuan_harga = re.search(r'\b(\d{6,})[.,]?\d*\b', user_input.replace('.', '').replace(',', ''))
        if temuan_harga:
            try:
                budget = int(temuan_harga.group(1))  # Ambil nilai angka dari input user

                # === Prediksi kategori harga berdasarkan input budget ===
                predicted_kategori = model.predict(pd.DataFrame([[budget]], columns=['harga']))[0]
                print(f"Evangeline : Aku prediksi budget kamu termasuk kategori '{predicted_kategori}', maka")

                # === Cari paket wisata yang harga-nya <= budget user ===
                cursor.execute("SELECT nama_paket, tempat, harga, kontak_sales FROM paket_wisata WHERE harga <= %s", (budget,))
                hasil = cursor.fetchall()

                if hasil:
                    print("Evangeline : Ini pilihan paket yang cocok sama budget kamu :")
                    for i, row in enumerate(hasil, 1):
                        print(f"  Opsi {i}: {row[0]} ke {row[1]} - Rp{row[2]:,} (Hubungi : {row[3]})")
                    print(f"(Akurasi : {accuracy*100:.2f}%)")  # Tampilkan akurasi
                else:
                    print("Evangeline : Budget kamu belum cukup untuk paket yang tersedia, coba tanya langsung ke sales ya.")
            except:
                print("Evangeline : Waduh, ada kesalahan pas baca budget kamu, coba ulangi yaa~")
        else:
            # Kalau input bukan budget, maka akan mencocokan ke pertanyaan yang ada di DB
            cursor.execute("SELECT jawaban FROM chatbot WHERE %s LIKE CONCAT('%%', pertanyaan, '%%') LIMIT 1", (user_input,))
            hasil = cursor.fetchone()
            if hasil:
                print(f"Evangeline : {hasil[0]}")
            else:
                print("Evangeline : Maaf, saya belum tahu jawaban dari pertanyaan itu.")
    else:
        print("Bot sedang mati, ketik 'on' untuk menyalakannya.")

# Tutup koneksi ke database setelah chatbot selesai
cursor.close()
connect.close()
