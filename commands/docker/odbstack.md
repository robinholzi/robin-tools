# Orbstack

orb run -m ubuntu DRGHOME=$(pwd) ./getdrgb ~/workspace/qc-drg-grouper/data/2025-LG/2024/train/sample/in.txt ./out.txt inek2025_lg.ini
orb create -a amd64 ubuntu

extract stuff: ouch d

orb run -m ubuntu DRGHOME=$(pwd) ./getdrgb data/2025-LG-mini-632/2024/train/in.txt data/2025-LG-mini-632/2024/train/geos.txt spec_geos_inek.ini && cat data/2025-LG-mini-632/2024/train/geos.txt | grep T81
