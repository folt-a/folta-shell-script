#!/bin/bash

# 重ねるやつとりあえず作成

composite sheets/spriteSheet_fuku.png sheets/spriteSheet_bg.png sheets/merged.png
composite sheets/spriteSheet_karada.png sheets/merged.png sheets/merged.png
composite sheets/spriteSheet_kami.png sheets/merged.png sheets/merged.png

# エフェクトは加算発光50%で重ねたい
# composite spriteSheet_effect.png merged.png merged.png

# composite -alpha on -evaluate set 50% spriteSheet_effect.png merged.png merged.png

# magick layer1 layer2 ... layer5 ( -clone 0--1 -background none -flatten ) +insert result.psd