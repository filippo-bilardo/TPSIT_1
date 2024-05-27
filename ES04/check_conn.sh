echo Script controllo connessione Internet
ck_conn () {
    wget -q --spider http://google.com
    if [ $? -eq 0 ]; then
        echo "Connessione attiva"
    else
        echo "Connessione non attiva"
    fi
}
ck_conn
if [ $? -eq 0 ]; then
    wget google.com
fi
