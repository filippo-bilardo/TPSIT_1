#!/bin/bash
# Script di esempio: archiviazione e compressione

# Crea directory e file di test se non esistono
if [ ! -d "demo_archivi" ]; then
    echo "Creazione directory di dimostrazione per archivi..."
    mkdir -p demo_archivi/documenti demo_archivi/immagini demo_archivi/script
    
    # Crea alcuni file di test
    echo "Creazione file di esempio..."
    echo "Questo è un documento di testo." > demo_archivi/documenti/doc1.txt
    echo "Questo è un altro documento di testo." > demo_archivi/documenti/doc2.txt
    echo "#!/bin/bash\necho \"Questo è uno script di esempio.\"" > demo_archivi/script/script1.sh
    echo "#!/bin/bash\necho \"Questo è un altro script di esempio.\"" > demo_archivi/script/script2.sh
    
    # Creiamo file binari fittizi per simulare immagini
    dd if=/dev/urandom of=demo_archivi/immagini/img1.jpg bs=1K count=10 2>/dev/null
    dd if=/dev/urandom of=demo_archivi/immagini/img2.jpg bs=1K count=15 2>/dev/null
    dd if=/dev/urandom of=demo_archivi/immagini/img3.jpg bs=1K count=20 2>/dev/null
    
    echo "Directory di dimostrazione creata."
fi

echo -e "\n=== ESEMPI DI ARCHIVIAZIONE CON TAR ==="

echo -e "\n1. Creazione di un archivio tar:"
tar -cvf demo_archivi/archivio.tar demo_archivi/documenti
ls -lh demo_archivi/archivio.tar

echo -e "\n2. Visualizzazione del contenuto di un archivio tar:"
tar -tvf demo_archivi/archivio.tar

echo -e "\n3. Estrazione di un archivio tar in una nuova directory:"
mkdir -p demo_archivi/estratto
tar -xvf demo_archivi/archivio.tar -C demo_archivi/estratto
ls -la demo_archivi/estratto/demo_archivi/documenti

echo -e "\n=== ESEMPI DI COMPRESSIONE ==="

echo -e "\n1. Compressione di un file con gzip:"
cp demo_archivi/documenti/doc1.txt demo_archivi/doc_to_compress.txt
gzip demo_archivi/doc_to_compress.txt
ls -lh demo_archivi/doc_to_compress.txt.gz

echo -e "\n2. Decompressione di un file con gunzip:"
gunzip -c demo_archivi/doc_to_compress.txt.gz > demo_archivi/doc_decompressed.txt
ls -lh demo_archivi/doc_decompressed.txt
cat demo_archivi/doc_decompressed.txt

echo -e "\n=== ESEMPI DI ARCHIVIO COMPRESSO (TAR + GZIP) ==="

echo -e "\n1. Creazione di un archivio tar compresso (tarball):"
tar -czvf demo_archivi/immagini.tar.gz demo_archivi/immagini
ls -lh demo_archivi/immagini.tar.gz

echo -e "\n2. Visualizzazione del contenuto di un archivio tar.gz:"
tar -tzvf demo_archivi/immagini.tar.gz

echo -e "\n3. Estrazione di un archivio tar.gz:"
mkdir -p demo_archivi/estratto_tarball
tar -xzvf demo_archivi/immagini.tar.gz -C demo_archivi/estratto_tarball
ls -la demo_archivi/estratto_tarball/demo_archivi/immagini

echo -e "\n=== ESEMPIO CON BZIP2 (più efficiente di gzip per alcuni tipi di dati) ==="

# Verifica se bzip2 è installato
if command -v bzip2 >/dev/null 2>&1; then
    echo -e "\n1. Creazione di un archivio tar compresso con bzip2:"
    tar -cjvf demo_archivi/script.tar.bz2 demo_archivi/script
    ls -lh demo_archivi/script.tar.bz2
    
    echo -e "\n2. Estrazione di un archivio tar.bz2:"
    mkdir -p demo_archivi/estratto_bz2
    tar -xjvf demo_archivi/script.tar.bz2 -C demo_archivi/estratto_bz2
    ls -la demo_archivi/estratto_bz2/demo_archivi/script
else
    echo -e "\nbzip2 non è installato. Puoi installarlo con:"
    echo "sudo apt-get install bzip2  # per Debian/Ubuntu"
    echo "sudo yum install bzip2      # per CentOS/RHEL"
fi

echo -e "\n=== CONFRONTO DI DIMENSIONI TRA DIVERSI METODI DI COMPRESSIONE ==="

# Creiamo un file di testo con contenuto ripetitivo (comprimibile)
echo "Creazione di un file di test per confrontare metodi di compressione..."
for i in {1..1000}; do
    echo "Questa è una riga di testo che si ripete per testare la compressione. $i" >> demo_archivi/test_compressione.txt
done

# Dimensione originale
ORIG_SIZE=$(du -h demo_archivi/test_compressione.txt | cut -f1)

# Dimensione con gzip
cp demo_archivi/test_compressione.txt demo_archivi/test_gzip.txt
gzip demo_archivi/test_gzip.txt
GZIP_SIZE=$(du -h demo_archivi/test_gzip.txt.gz | cut -f1)

# Dimensione con bzip2 (se disponibile)
if command -v bzip2 >/dev/null 2>&1; then
    cp demo_archivi/test_compressione.txt demo_archivi/test_bzip2.txt
    bzip2 demo_archivi/test_bzip2.txt
    BZIP2_SIZE=$(du -h demo_archivi/test_bzip2.txt.bz2 | cut -f1)
    BZIP2_INFO="- File compresso con bzip2: $BZIP2_SIZE"
else
    BZIP2_INFO="- bzip2 non installato"
fi

# Dimensione con xz (se disponibile)
if command -v xz >/dev/null 2>&1; then
    cp demo_archivi/test_compressione.txt demo_archivi/test_xz.txt
    xz demo_archivi/test_xz.txt
    XZ_SIZE=$(du -h demo_archivi/test_xz.txt.xz | cut -f1)
    XZ_INFO="- File compresso con xz: $XZ_SIZE"
else
    XZ_INFO="- xz non installato"
fi

echo -e "\nConfrontiamo le dimensioni:"
echo "- File originale: $ORIG_SIZE"
echo "- File compresso con gzip: $GZIP_SIZE"
echo "$BZIP2_INFO"
echo "$XZ_INFO"

echo -e "\nScript completato. I file di dimostrazione si trovano nella directory 'demo_archivi'."
