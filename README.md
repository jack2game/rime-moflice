# Moflice = Moran + Flypy + Ice
- This scheme is largely based on the awesome [rime-moran](https://github.com/ksqsf/rime-moran). You should check it out if you haven't.
- [rime-moran's wiki](https://github.com/ksqsf/rime-moran/wiki) in its entirety should be applicable to Moflice. I will be handling this project with a very lean doc. Feel free to discuss by opening PR or raising issues. Reading comments on codes is also a good alternative. You can also join Moran's group chat to seek help.
- All the Double Pinyin (Shuangpin) codes in rime-moran have been replaced with [Flypy's Shuangpin scheme](https://flypy.cc/#/up). If you want to use Ziranma's Shuangpin scheme, you can use the OG rime-moran as linked above.
- The human-curated, one of the largest words/sentences library for Chinese language, [rime-ice](https://github.com/iDvel/rime-ice), is bolted onto this repo, providing a seamless input experience with the ease of typing.

Some fineprints:
- rime-ice's Tencent library is disabled by default, due to the large size of the file leading to an extremely long deployment time. If you want to enable it, change [this file](lihttps://github.com/jack2game/rime-moflice/blob/main/moflice-chs/moran.extended.dict.yaml).
