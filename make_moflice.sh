#!/bin/bash

set -e
set -x

# BUILD_TYPE="$1"

rm -rf moflice-cht
rm -rf moflice-chs

# 生成繁體
cp -a ./rime-moran/. ./moflice-cht

rm ./moflice-cht/default.yaml
rm ./moflice-cht/key_bindings.yaml
rm ./moflice-cht/punctuation.yaml
rm ./moflice-cht/.git
rm ./moflice-cht/.gitignore
rm ./moflice-cht/README.md
rm ./moflice-cht/README-en.md
rm -rf ./moflice-cht/.github/

cp ./rime-moran/tools/data/zrmdb.txt ./tools-additional
sed -i 's/ /\t/g' ./tools-additional/zrmdb.txt

# 生成簡體

cd ./moflice-cht/
sed -i "s/^git archive HEAD -o archive.tar/tar -cvf archive.tar .\//g" ./make_simp_dist.sh
sed -i "s/^cp 下载与安装说明/# cp 下载与安装说明/g" ./make_simp_dist.sh
sed -i "s/^sedi 's\/MORAN_VARIANT\/简体\/'/# sedi 's\/MORAN_VARIANT\/简体\/'/g" ./make_simp_dist.sh
sed -i 's/^7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on "MoranSimplified-$(date +%Y%m%d).7z" dist/cp -a .\/dist\/. ..\/moflice-chs/g' ./make_simp_dist.sh
cd ..

mkdir -p ./moflice-cht/ice-dicts/
mkdir -p ./moflice-chs/ice-dicts/

cd ./tools-additional
# 生成繁體霧凇
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/8105.dict.yaml    -x zrmdb -t -o ../moflice-cht/ice-dicts/flypy_zrmdb_8105.dict.yaml
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/41448.dict.yaml   -x zrmdb -t -o ../moflice-cht/ice-dicts/flypy_zrmdb_41448.dict.yaml
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/base.dict.yaml    -x zrmdb -t -o ../moflice-cht/ice-dicts/flypy_zrmdb_base.dict.yaml
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/ext.dict.yaml     -x zrmdb -t -o ../moflice-cht/ice-dicts/flypy_zrmdb_ext.dict.yaml
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/others.dict.yaml  -x zrmdb -t -o ../moflice-cht/ice-dicts/flypy_zrmdb_others.dict.yaml
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/tencent.dict.yaml -x zrmdb -t -o ../moflice-cht/ice-dicts/flypy_zrmdb_tencent.dict.yaml
# 生成簡體霧凇
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/8105.dict.yaml    -x zrmdb -o ../moflice-chs/ice-dicts/flypy_zrmdb_8105.dict.yaml
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/41448.dict.yaml   -x zrmdb -o ../moflice-chs/ice-dicts/flypy_zrmdb_41448.dict.yaml
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/base.dict.yaml    -x zrmdb -o ../moflice-chs/ice-dicts/flypy_zrmdb_base.dict.yaml
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/ext.dict.yaml     -x zrmdb -o ../moflice-chs/ice-dicts/flypy_zrmdb_ext.dict.yaml
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/others.dict.yaml  -x zrmdb -o ../moflice-chs/ice-dicts/flypy_zrmdb_others.dict.yaml
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/tencent.dict.yaml -x zrmdb -o ../moflice-chs/ice-dicts/flypy_zrmdb_tencent.dict.yaml
cd ..