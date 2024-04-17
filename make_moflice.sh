#!/bin/bash

set -e
set -x

# BUILD_TYPE="$1"

# 生成繁體

rm -rf moflice-cht
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

mkdir -p ./moflice-cht/ice-dicts/
mkdir -p ./moflice-chs/ice-dicts/

cd ./tools-additional
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/8105.dict.yaml    -x zrmdb -t -o ../moflice-cht/ice-dicts/flypy_zrmdb_8105.dict.yaml
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/41448.dict.yaml   -x zrmdb -t -o ../moflice-cht/ice-dicts/flypy_zrmdb_41448.dict.yaml
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/base.dict.yaml    -x zrmdb -t -o ../moflice-cht/ice-dicts/flypy_zrmdb_base.dict.yaml
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/ext.dict.yaml     -x zrmdb -t -o ../moflice-cht/ice-dicts/flypy_zrmdb_ext.dict.yaml
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/others.dict.yaml  -x zrmdb -t -o ../moflice-cht/ice-dicts/flypy_zrmdb_others.dict.yaml
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/tencent.dict.yaml -x zrmdb -t -o ../moflice-cht/ice-dicts/flypy_zrmdb_tencent.dict.yaml

python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/8105.dict.yaml    -x zrmdb -o ../moflice-chs/ice-dicts/flypy_zrmdb_8105.dict.yaml
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/41448.dict.yaml   -x zrmdb -o ../moflice-chs/ice-dicts/flypy_zrmdb_41448.dict.yaml
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/base.dict.yaml    -x zrmdb -o ../moflice-chs/ice-dicts/flypy_zrmdb_base.dict.yaml
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/ext.dict.yaml     -x zrmdb -o ../moflice-chs/ice-dicts/flypy_zrmdb_ext.dict.yaml
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/others.dict.yaml  -x zrmdb -o ../moflice-chs/ice-dicts/flypy_zrmdb_others.dict.yaml
python3 gen_dict_with_shape.py -i ../rime-ice/cn_dicts/tencent.dict.yaml -x zrmdb -o ../moflice-chs/ice-dicts/flypy_zrmdb_tencent.dict.yaml
cd ..