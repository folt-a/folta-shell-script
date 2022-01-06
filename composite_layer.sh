#!/bin/bash

# 重ねるやつとりあえず作成

composite spriteSheet_fuku.png spriteSheet_bg.png merged.png
composite spriteSheet_karada.png merged.png merged.png
composite spriteSheet_kami.png merged.png merged.png

; エフェクトは加算発光50%で重ねたい
; composite spriteSheet_effect.png merged.png merged.png

; composite -alpha on -evaluate set 50% spriteSheet_effect.png merged.png merged.png

; magick layer1 layer2 ... layer5 ( -clone 0--1 -background none -flatten ) +insert result.psd