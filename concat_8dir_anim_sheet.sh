#!/bin/bash

# 8方向アニメーションのスプライトを結合する

for file in `ls org/Camera_1_*0000*.png`; do

    # split
    splitres=(${file//_/  })
    # Split結果の最後を取得
    filename=${splitres[-1]}
    echo $filename

    # まずリサイズする
    for file2 in `ls org/Camera_*.png`; do

        # split
        splitres2=(${file2//_/  })
        # Split結果の最後（ファイル名）を取得
        filename2=${splitres2[-1]}

        if [ $filename = $filename2 ]; then
        newfile=(`basename ${file2}`)

        convert ${file2} -resize 144x144 converted/${newfile}

        fi
    done

    # たてにくっつける
    convert converted/*_Front_*${filename} +append sheets/tmpFront_${filename}
    convert converted/*_FrontLeft_*${filename} +append sheets/tmpFrontLeft_${filename}
    convert converted/*_FrontRight_*${filename} +append sheets/tmpFrontRight_${filename}
    convert converted/*_Back_*${filename} +append sheets/tmpBack_${filename}
    convert converted/*_BackRight_*${filename} +append sheets/tmpBackRight_${filename}
    convert converted/*_BackLeft_*${filename} +append sheets/tmpBackLeft_${filename}
    convert converted/*_Right_*${filename} +append sheets/tmpRight_${filename}
    convert converted/*_Left_*${filename} +append sheets/tmpLeft_${filename}

    convert sheets/tmpFront_${filename} sheets/tmpFrontRight_${filename} sheets/tmpRight_${filename} sheets/tmpBackRight_${filename} sheets/tmpBack_${filename} sheets/tmpBackLeft_${filename} sheets/tmpLeft_${filename} sheets/tmpFrontLeft_${filename} -append sheets/spriteSheet_${filename}
    
    rm -rf sheets/tmp*
    
    # mogrify -resize 144x144 -unsharp 1.5x1+0.7+0.02 spriteSheet
done
