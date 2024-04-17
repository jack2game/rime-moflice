#!/bin/bash

set -e
set -x

# BUILD_TYPE="$1"

rm -rf moflice-chs
rm -rf moflice-cht

# 生成繁體
cp -a ./rime-moran/. ./moflice-cht

rm -rf ./moflice-cht/default.yaml
rm -rf ./moflice-cht/key_bindings.yaml
rm -rf ./moflice-cht/punctuation.yaml
rm -rf ./moflice-cht/.git
rm -rf ./moflice-cht/.gitignore
rm -rf ./moflice-cht/README.md
rm -rf ./moflice-cht/README-en.md
rm -rf ./moflice-cht/.github/

cp ./rime-moran/tools/data/zrmdb.txt ./tools-additional
sed -i 's/ /\t/g' ./tools-additional/zrmdb.txt

# 生成簡體
cd ./moflice-cht/
sed -i "s/^git archive HEAD -o archive.tar/tar -cvf archive.tar .\//g" ./make_simp_dist.sh
sed -i "s/^cp 下载与安装说明/# cp 下载与安装说明/g" ./make_simp_dist.sh
sed -i "s/^sedi 's\/MORAN_VARIANT\/简体\/'/# sedi 's\/MORAN_VARIANT\/简体\/'/g" ./make_simp_dist.sh
sed -i 's/^7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on "MoranSimplified-$(date +%Y%m%d).7z" dist/cp -a .\/dist\/. ..\/moflice-chs/g' ./make_simp_dist.sh
bash -x ./make_simp_dist.sh
cd ..

# 轉換詞庫
cd ./rime-moran/tools
# 轉換繁体詞庫
echo 轉換繁体詞庫...
python3 schemagen.py convert-sp --to=flypy --rime-dict=../../moflice-cht/moran.chars.dict.yaml > ../../moflice-cht/moran.chars.dict.yaml.bak
python3 schemagen.py convert-sp --to=flypy --rime-dict=../../moflice-cht/moran.essay.dict.yaml > ../../moflice-cht/moran.essay.dict.yaml.bak
python3 schemagen.py convert-sp --to=flypy --rime-dict=../../moflice-cht/moran.tencent.dict.yaml > ../../moflice-cht/moran.tencent.dict.yaml.bak
python3 schemagen.py convert-sp --to=flypy --rime-dict=../../moflice-cht/moran.moe.dict.yaml > ../../moflice-cht/moran.moe.dict.yaml.bak
python3 schemagen.py convert-sp --to=flypy --rime-dict=../../moflice-cht/moran.thuocl.dict.yaml > ../../moflice-cht/moran.thuocl.dict.yaml.bak
python3 schemagen.py convert-sp --to=flypy --rime-dict=../../moflice-cht/moran.computer.dict.yaml > ../../moflice-cht/moran.computer.dict.yaml.bak
python3 schemagen.py convert-sp --to=flypy --rime-dict=../../moflice-cht/moran.hanyu.dict.yaml > ../../moflice-cht/moran.hanyu.dict.yaml.bak
python3 schemagen.py convert-sp --to=flypy --rime-dict=../../moflice-cht/moran.words.dict.yaml > ../../moflice-cht/moran.words.dict.yaml.bak
python3 schemagen.py convert-fixed-sp --to=flypy --rime-dict=../../moflice-cht/moran_fixed.dict.yaml > ../../moflice-cht/moran_fixed.dict.yaml.bak
python3 schemagen.py convert-fixed-sp --to=flypy --rime-dict=../../moflice-cht/moran_fixed_simp.dict.yaml > ../../moflice-cht/moran_fixed_simp.dict.yaml.bak
mv ../../moflice-cht/moran.chars.dict.yaml{.bak,}
mv ../../moflice-cht/moran.computer.dict.yaml{.bak,}
mv ../../moflice-cht/moran.essay.dict.yaml{.bak,}
mv ../../moflice-cht/moran.hanyu.dict.yaml{.bak,}
mv ../../moflice-cht/moran.moe.dict.yaml{.bak,}
mv ../../moflice-cht/moran.tencent.dict.yaml{.bak,}
mv ../../moflice-cht/moran.thuocl.dict.yaml{.bak,}
mv ../../moflice-cht/moran.words.dict.yaml{.bak,}
mv ../../moflice-cht/moran_fixed.dict.yaml{.bak,}
mv ../../moflice-cht/moran_fixed_simp.dict.yaml{.bak,}
# 轉換简体詞庫
echo 轉換简体詞庫...
python3 schemagen.py convert-sp --to=flypy --rime-dict=../../moflice-chs/moran.chars.dict.yaml > ../../moflice-chs/moran.chars.dict.yaml.bak
python3 schemagen.py convert-sp --to=flypy --rime-dict=../../moflice-chs/moran.essay.dict.yaml > ../../moflice-chs/moran.essay.dict.yaml.bak
python3 schemagen.py convert-sp --to=flypy --rime-dict=../../moflice-chs/moran.tencent.dict.yaml > ../../moflice-chs/moran.tencent.dict.yaml.bak
python3 schemagen.py convert-sp --to=flypy --rime-dict=../../moflice-chs/moran.moe.dict.yaml > ../../moflice-chs/moran.moe.dict.yaml.bak
python3 schemagen.py convert-sp --to=flypy --rime-dict=../../moflice-chs/moran.thuocl.dict.yaml > ../../moflice-chs/moran.thuocl.dict.yaml.bak
python3 schemagen.py convert-sp --to=flypy --rime-dict=../../moflice-chs/moran.computer.dict.yaml > ../../moflice-chs/moran.computer.dict.yaml.bak
python3 schemagen.py convert-sp --to=flypy --rime-dict=../../moflice-chs/moran.hanyu.dict.yaml > ../../moflice-chs/moran.hanyu.dict.yaml.bak
python3 schemagen.py convert-sp --to=flypy --rime-dict=../../moflice-chs/moran.words.dict.yaml > ../../moflice-chs/moran.words.dict.yaml.bak
python3 schemagen.py convert-fixed-sp --to=flypy --rime-dict=../../moflice-chs/moran_fixed.dict.yaml > ../../moflice-chs/moran_fixed.dict.yaml.bak
python3 schemagen.py convert-fixed-sp --to=flypy --rime-dict=../../moflice-chs/moran_fixed_simp.dict.yaml > ../../moflice-chs/moran_fixed_simp.dict.yaml.bak
mv ../../moflice-chs/moran.chars.dict.yaml{.bak,}
mv ../../moflice-chs/moran.computer.dict.yaml{.bak,}
mv ../../moflice-chs/moran.essay.dict.yaml{.bak,}
mv ../../moflice-chs/moran.hanyu.dict.yaml{.bak,}
mv ../../moflice-chs/moran.moe.dict.yaml{.bak,}
mv ../../moflice-chs/moran.tencent.dict.yaml{.bak,}
mv ../../moflice-chs/moran.thuocl.dict.yaml{.bak,}
mv ../../moflice-chs/moran.words.dict.yaml{.bak,}
mv ../../moflice-chs/moran_fixed.dict.yaml{.bak,}
mv ../../moflice-chs/moran_fixed_simp.dict.yaml{.bak,}
cd ..
cd ..

# 整理文件結構
rm -rf ./moflice-cht/tools
rm -rf ./moflice-cht/make_simp_dist.sh
mkdir -p ./moflice-cht/ice-dicts/
mkdir -p ./moflice-chs/ice-dicts/
cp -a ./schema/. ./moflice-cht
cp -a ./schema/. ./moflice-chs

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

echo Moflice繁體設定檔...
cd moflice-cht
cp moran.extended.dict.yaml moran.extended.dict.yaml.bak
sed -i "s/\(  - moran\.essay  \)/  # - ice-dicts\/flypy_zrmdb_8105      # 8105字表\n\1/g" ./moran.extended.dict.yaml
sed -i "s/\(  - moran\.essay  \)/  # - ice-dicts\/flypy_zrmdb_41448     # 41448字表\n\1/g" ./moran.extended.dict.yaml
sed -i "s/\(  - moran\.essay  \)/  - ice-dicts\/flypy_zrmdb_base     # 基础词库\n\1/g" ./moran.extended.dict.yaml
sed -i "s/\(  - moran\.essay  \)/  - ice-dicts\/flypy_zrmdb_ext      # 扩展词库\n\1/g" ./moran.extended.dict.yaml
sed -i "s/\(  - moran\.essay  \)/  # - ice-dicts\/flypy_zrmdb_tencent  # 腾讯词向量（大词库，部署时间较长）\n\1/g" ./moran.extended.dict.yaml
sed -i "s/\(  - moran\.essay  \)/  # - ice-dicts\/flypy_zrmdb_others   # 一些杂项 容错音和错字 可以不开\n\1/g" ./moran.extended.dict.yaml

cp moran.schema.yaml moflice.schema.yaml
sed -i "s/^  schema_id: moran$/  schema_id: moflice/g" ./moflice.schema.yaml
sed -i "s/^  name: 魔然$/  name: Moflice/g" ./moflice.schema.yaml
sed -i "s/^\(    - 方案製作：ksqsf\)$/\1\n    - Integrator：jack2game/g" ./moflice.schema.yaml
sed -i "s/^    爲傳承字設計的自然碼及輔助碼智能整句輸入方案。$/    Moflice = Moran + Flypy + Ice/g" ./moflice.schema.yaml
sed -i "s/^    - moran_fixed$/    - moflice_fixed/g" ./moflice.schema.yaml
sed -i "s/^    - moran_sentence$/    - moflice_sentence/g" ./moflice.schema.yaml

cp moran_aux.schema.yaml moflice_aux.schema.yaml
sed -i "s/^  schema_id: moran_aux$/  schema_id: moflice_aux/g" ./moflice_aux.schema.yaml
sed -i "s/^  name: 魔然·輔篩$/  name: Moflice-Aux/g" ./moflice_aux.schema.yaml
sed -i "s/^\(    - 方案製作：ksqsf\)$/\1\n    - Integrator：jack2game/g" ./moflice_aux.schema.yaml
sed -i "s/^    在輸入完畢雙拼碼後，可以輸入輔助碼篩選候選項，與「魔然」方案不同。$/    Moflice plus aux codes/g" ./moflice_aux.schema.yaml

cp moran_bj.schema.yaml moflice_bj.schema.yaml
sed -i "s/^  schema_id: moran_bj$/  schema_id: moflice_bj/g" ./moflice_bj.schema.yaml
sed -i "s/^  name: 魔然·並擊G$/  name: Moflice-Dual-Wielding/g" ./moflice_bj.schema.yaml
sed -i "s/^\(    - 方案製作：ksqsf\)$/\1\n    - Integrator：jack2game/g" ./moflice_bj.schema.yaml
sed -i "s/^    爲傳承字設計的自然碼及輔助碼智能整句輸入方案。$/    Moflice = Moran + Flypy + Ice/g" ./moflice_bj.schema.yaml
sed -i "s/^    - moran_fixed$/    - moflice_fixed/g" ./moflice_bj.schema.yaml
sed -i "s/^    - moran_sentence$/    - moflice_sentence/g" ./moflice_bj.schema.yaml

cp moran_fixed.schema.yaml moflice_fixed.schema.yaml
sed -i "s/^  schema_id: moran_fixed$/  schema_id: moflice_fixed/g" ./moflice_fixed.schema.yaml
sed -i "s/^  name: 魔然·字詞$/  name: Moflice-Words-and-Phrases/g" ./moflice_fixed.schema.yaml
sed -i "s/^\(    - 方案製作：ksqsf\)$/\1\n    - Integrator：jack2game/g" ./moflice_fixed.schema.yaml

cp moran_sentence.schema.yaml moflice_sentence.schema.yaml
sed -i "s/^  schema_id: moran_sentence$/  schema_id: moflice_sentence/g" ./moflice_sentence.schema.yaml
sed -i "s/^  name: 魔然·整句$/  name: Moflice-Sentence/g" ./moflice_sentence.schema.yaml
sed -i "s/^\(    - 方案製作：ksqsf\)$/\1\n    - Integrator：jack2game/g" ./moflice_sentence.schema.yaml
cd ..

echo Moflice简体設定檔...
cd moflice-chs
cp moran.extended.dict.yaml moran.extended.dict.yaml.bak
sed -i "s/\(  - moran\.essay  \)/  # - ice-dicts\/flypy_zrmdb_8105      # 8105字表\n\1/g" ./moran.extended.dict.yaml
sed -i "s/\(  - moran\.essay  \)/  # - ice-dicts\/flypy_zrmdb_41448     # 41448字表\n\1/g" ./moran.extended.dict.yaml
sed -i "s/\(  - moran\.essay  \)/  - ice-dicts\/flypy_zrmdb_base     # 基础词库\n\1/g" ./moran.extended.dict.yaml
sed -i "s/\(  - moran\.essay  \)/  - ice-dicts\/flypy_zrmdb_ext      # 扩展词库\n\1/g" ./moran.extended.dict.yaml
sed -i "s/\(  - moran\.essay  \)/  # - ice-dicts\/flypy_zrmdb_tencent  # 腾讯词向量（大词库，部署时间较长）\n\1/g" ./moran.extended.dict.yaml
sed -i "s/\(  - moran\.essay  \)/  # - ice-dicts\/flypy_zrmdb_others   # 一些杂项 容错音和错字 可以不开\n\1/g" ./moran.extended.dict.yaml

cp moran.schema.yaml moflice.schema.yaml
sed -i "s/^  schema_id: moran$/  schema_id: moflice/g" ./moflice.schema.yaml
sed -i "s/^  name: 魔然$/  name: Moflice/g" ./moflice.schema.yaml
sed -i "s/^\(    - 方案製作：ksqsf\)$/\1\n    - Integrator：jack2game/g" ./moflice.schema.yaml
sed -i "s/^    爲傳承字設計的自然碼及輔助碼智能整句輸入方案。$/    Moflice = Moran + Flypy + Ice/g" ./moflice.schema.yaml
sed -i "s/^    - moran_fixed$/    - moflice_fixed/g" ./moflice.schema.yaml
sed -i "s/^    - moran_sentence$/    - moflice_sentence/g" ./moflice.schema.yaml

cp moran_aux.schema.yaml moflice_aux.schema.yaml
sed -i "s/^  schema_id: moran_aux$/  schema_id: moflice_aux/g" ./moflice_aux.schema.yaml
sed -i "s/^  name: 魔然·輔篩$/  name: Moflice-Aux/g" ./moflice_aux.schema.yaml
sed -i "s/^\(    - 方案製作：ksqsf\)$/\1\n    - Integrator：jack2game/g" ./moflice_aux.schema.yaml
sed -i "s/^    在輸入完畢雙拼碼後，可以輸入輔助碼篩選候選項，與「魔然」方案不同。$/    Moflice plus aux codes/g" ./moflice_aux.schema.yaml

cp moran_bj.schema.yaml moflice_bj.schema.yaml
sed -i "s/^  schema_id: moran_bj$/  schema_id: moflice_bj/g" ./moflice_bj.schema.yaml
sed -i "s/^  name: 魔然·並擊G$/  name: Moflice-Dual-Wielding/g" ./moflice_bj.schema.yaml
sed -i "s/^\(    - 方案製作：ksqsf\)$/\1\n    - Integrator：jack2game/g" ./moflice_bj.schema.yaml
sed -i "s/^    爲傳承字設計的自然碼及輔助碼智能整句輸入方案。$/    Moflice = Moran + Flypy + Ice/g" ./moflice_bj.schema.yaml
sed -i "s/^    - moran_fixed$/    - moflice_fixed/g" ./moflice_bj.schema.yaml
sed -i "s/^    - moran_sentence$/    - moflice_sentence/g" ./moflice_bj.schema.yaml

cp moran_fixed.schema.yaml moflice_fixed.schema.yaml
sed -i "s/^  schema_id: moran_fixed$/  schema_id: moflice_fixed/g" ./moflice_fixed.schema.yaml
sed -i "s/^  name: 魔然·字詞$/  name: Moflice-Words-and-Phrases/g" ./moflice_fixed.schema.yaml
sed -i "s/^\(    - 方案製作：ksqsf\)$/\1\n    - Integrator：jack2game/g" ./moflice_fixed.schema.yaml

cp moran_sentence.schema.yaml moflice_sentence.schema.yaml
sed -i "s/^  schema_id: moran_sentence$/  schema_id: moflice_sentence/g" ./moflice_sentence.schema.yaml
sed -i "s/^  name: 魔然·整句$/  name: Moflice-Sentence/g" ./moflice_sentence.schema.yaml
sed -i "s/^\(    - 方案製作：ksqsf\)$/\1\n    - Integrator：jack2game/g" ./moflice_sentence.schema.yaml
cd ..

# 删除冗餘魔然dict
# rm ./moflice-cht/moran.chars.dict.yaml
# rm ./moflice-cht/moran.essay.dict.yaml
# rm ./moflice-cht/moran.tencent.dict.yaml
# rm ./moflice-cht/moran.moe.dict.yaml
# rm ./moflice-cht/moran.thuocl.dict.yaml
# rm ./moflice-cht/moran.computer.dict.yaml
# rm ./moflice-cht/moran.hanyu.dict.yaml
# rm ./moflice-cht/moran.words.dict.yaml
# rm ./moflice-cht/moran_fixed.dict.yaml
# rm ./moflice-cht/moran_fixed_simp.dict.yaml

# rm ./moflice-chs/moran.chars.dict.yaml
# rm ./moflice-chs/moran.essay.dict.yaml
# rm ./moflice-chs/moran.tencent.dict.yaml
# rm ./moflice-chs/moran.moe.dict.yaml
# rm ./moflice-chs/moran.thuocl.dict.yaml
# rm ./moflice-chs/moran.computer.dict.yaml
# rm ./moflice-chs/moran.hanyu.dict.yaml
# rm ./moflice-chs/moran.words.dict.yaml
# rm ./moflice-chs/moran_fixed.dict.yaml
# rm ./moflice-chs/moran_fixed_simp.dict.yaml