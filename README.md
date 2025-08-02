----------------------------------------

<h1>Tutorial Menginstall Bot Nya </h1>

</br>
</br>

Alat Alat Yang Di Butuhkan : </br>
1. Software Web Server Stack : </br>
    - Laragon Versi 6 (minimal) </br>
    - XAMPP </br>
2. PHP V.8.1.10 </br>
3. Python V.3.13.1 </br>

</br>
</br>

Langkah Langkah Awal : </br>
1. Download bahan yang sudah tertera di repository nya </br>
2. Buat folder kosong (nama bebas), sebagai contoh : example</br>
3. Lalu pilih file bernama "chatbot_travel.py" dan  yang tadi di download, dan masukan kedalam folder example yang baru saja di buat</br>
</br>

  Langkah Langkah Instalasi</br>
  NOTE : UUntuk instalasi nya ada dua cara, bisa memakai XAMPP atau Laragon</br>
</br>

*Instalasi Melewati Laragon :* </br>
1. Pindahkan folder  example ke folder "www" yang ada di laragon </br>
   Contoh path(Alamat) : ``` D:\laragon\www\ ```     <---- taruh di path ini
2. Nyalakan laragon, klik "Start All"
3. Klik terminal yang ada di laragon
4. Buat database agar bisa mengimport file "travel_bot.sql" menjadi database, ketik : </br>
   ```Command :
   - mysql -u root
   - CREATE DATABASE travel_bot; # Buat database dengan nama yang sama 
   - EXIT;
   - mysql -u root travel_bot < travel_bot.sql # Command untuk mengimport file travel_bot.sql ke dalam database yang baru saja di buat
5. Install dulu library untuk connect in mysql dengan python nya : </br>
  ```pip install mysql-connector-python```
6. Jalankan bot, ketik : </br>
   ```
   python chatbot_travel.py
</br>
</br>
</br>

*Instalasi Melewati XAMPP :* </br>
1. Pindahkan folder  example ke folder "htdocs" yang ada di XAMPP </br>
   Contoh path (Alamat) : ```C:\xampp\htdocs\ ```     <---- taruh di path ini
2. Buka XAMPP dan start : </br>
    - mysql
    - apache
3. Buka Browser, Ketik : ```http://localhost/phpmyadmin```
4. Buat database, dengan nama : ```travel_bot```
5. Klik tombol import di atas
6. Upload file travel_bot.sql yang ada di folder example tadi > Klik Go
7. Buka CMD, Ketik : </br>
   ```Command :
   - cd C:\xampp\htdocs\Chatbot-Final-test
   - python -m venv .venv
   - .venv\Scripts\activate
   - pip install mysql-connector-python pandas scikit-learn
8. Jalankan Bot, Ketik : </br>
    ```
    python chatbot_travel.py
</br>

----------------------------------------
