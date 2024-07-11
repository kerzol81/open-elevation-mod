#!/usr/bin/env bash
set -eu
set -x

WORKDIR='/code/data'

file1='SRTM_NE_250m_TIF'
file2='SRTM_SE_250m_TIF'
file3='SRTM_W_250m_TIF'

cd "$WORKDIR"

if [ -f "$file1.rar" ] || [ -f "$file2.rar" ] || [ -f "$file3.rar" ];then
    echo "[*] tile data files (RAR) have already been downloaded, exit"
    exit 0

elif [ -f "$file1.tif" ] || [ -f "$file2.tif" ] || [ -f "$file3.tif" ];then
    echo "[*] tile data files (TIF) have already been downloaded and extracted, exit"
    exit 0
else
    echo '[+] Downloading SRTM data files'
    wget "https://srtm.csi.cgiar.org/wp-content/uploads/files/250m/$file1.rar" && unar -f "$file1.rar" && rm -rf "$file1.rar"
    wget "https://srtm.csi.cgiar.org/wp-content/uploads/files/250m/$file2.rar" && unar -f "$file2.rar" && rm -rf "$file2.rar"
    wget "https://srtm.csi.cgiar.org/wp-content/uploads/files/250m/$file3.rar" && unar -f "$file3.rar" && rm -rf "$file3.rar"
fi

echo "[+] Done"

exit 0
