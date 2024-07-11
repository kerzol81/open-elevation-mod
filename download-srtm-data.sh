#!/usr/bin/env bash


set -eux

WORKDIR='/code/data'

cd "$WORKDIR"

if [ -f "/code/data/SRTM_NE_250m_TIF/SRTM_NE_250m.tif" ] || [ -f "/code/data/SRTM_SE_250m_TIF/SRTM_SE_250m.tif" ] || [ -f "/code/data/SRTM_W_250m_TIF/SRTM_W_250m.tif" ];then
    echo "[*] SRTM data files (TIF) have already been downloaded and extracted"
    exit 0
fi 

if test -f "/code/data/SRTM_NE_250m_TIF.rar" || test -f "/code/data/SRTM_SE_250m_TIF.rar"  || [ -f "/code/data/SRTM_W_250m_TIF.rar"];then
    echo "[*] SRTM data files (RAR) have already been downloaded"
    exit 0
fi


echo '[+] Downloading SRTM data files'
exit 1
wget "https://srtm.csi.cgiar.org/wp-content/uploads/files/250m/SRTM_NE_250m_TIF.rar" && unar -f "SRTM_NE_250m_TIF.rar" && rm -rf "SRTM_NE_250m_TIF.rar"
wget "https://srtm.csi.cgiar.org/wp-content/uploads/files/250m/SRTM_SE_250m_TIF.rar" && unar -f "SRTM_SE_250m_TIF.rar" && rm -rf "SRTM_SE_250m_TIF.rar"
wget "https://srtm.csi.cgiar.org/wp-content/uploads/files/250m/SRTM_W_250m_TIF.rar" && unar -f "SRTM_W_250m_TIF.rar" && rm -rf "SRTM_W_250m_TIF.rar"

echo "[+] Done"

exit 0
