#!/bin/bash

# 8方向アニメーションのスプライトを結合する

for file in `ls org/Camera_1_*0000*.png`; do

    # split
    splitres=(${file//_/  })
    # Split結果の最後を取得
    filename=${splitres[-1]}
    echo $filename

    for file2 in `ls org/Camera_*.png`; do

        # split
        splitres2=(${file2//_/  })
        # Split結果の最後を取得
        filename2=${splitres2[-1]}

        if [ $filename = $filename2 ]; then

        # まずリサイズする
        # mogrify -resize 144x144 -unsharp 1.5x1+0.7+0.02 ${file2}
        # mogrify -resize 144x144 ${file2}

        newfile=(`basename ${file2}`)

        convert ${file2} -resize 144x144 converted/${newfile}

        fi

        #   echo "copy ${file} to /home/foo"
        #   echo 
        #   cp $file /home/foo
    done


    # for i in {0..9}; do
    
    convert converted/*_Front_*${filename} +append converted/tmpFront_${filename}
    convert converted/*_FrontLeft_*${filename} +append converted/tmpFrontLeft_${filename}
    convert converted/*_FrontRight_*${filename} +append converted/tmpFrontRight_${filename}
    convert converted/*_Back_*${filename} +append converted/tmpBack_${filename}
    convert converted/*_BackRight_*${filename} +append converted/tmpBackRight_${filename}
    convert converted/*_BackLeft_*${filename} +append converted/tmpBackLeft_${filename}
    convert converted/*_Right_*${filename} +append converted/tmpRight_${filename}
    convert converted/*_Left_*${filename} +append converted/tmpLeft_${filename}
    convert converted/tmpFront_${filename} converted/tmpLeft_${filename} converted/tmpRight_${filename} converted/tmpBack_${filename} -append converted/tmpSpriteSheetLeft_${filename}
    convert converted/tmpFrontLeft_${filename} converted/tmpFrontRight_${filename} converted/tmpBackLeft_${filename} converted/tmpBackRight_${filename} -append converted/tmpSpriteSheetRight_${filename}
    convert converted/tmpSpriteSheetLeft_${filename} converted/tmpSpriteSheetRight_${filename} -append converted/spriteSheet_${filename}
    
    
    # mogrify -resize 144x144 -unsharp 1.5x1+0.7+0.02 spriteSheet

    # done
    #   echo "copy ${file} to /home/foo"
    #   echo 
    #   cp $file /home/foo

done


# for file in `ls */Camera_*.png`; do

#     # まずリサイズする
#     # magick mogrify -resize 144x144 -unsharp 1.5x1+0.7+0.02 ${file}

#     # split
#     splitres=(${file//_/  })
#     # Split結果の最後を取得
#     echo ${splitres[-1]}

# #   echo "copy ${file} to /home/foo"
# #   echo 
# #   cp $file /home/foo
# done

# magick convert Camera_1_Front_*.png +append tmpFront.png
# magick convert *_FrontLeft.png +append tmpFrontLeft.png
# magick convert *_FrontRight.png +append tmpFrontRight.png
# magick convert *_Back.png +append tmpBack.png
# magick convert *_BackRight.png +append tmpBackRight.png
# magick convert *_BackLeft.png +append tmpBackLeft.png
# magick convert *_Right.png +append tmpRight.png
# magick convert *_Left.png +append tmpLeft.png
# magick convert tmpFront.png tmpLeft.png tmpRight.png tmpBack.png -append tmpSpriteSheetLeft.png
# magick convert tmpFrontLeft.png tmpFrontRight.png tmpBackLeft.png tmpBackRight.png -append tmpSpriteSheetRight.png
# magick convert tmpSpriteSheetLeft.png tmpSpriteSheetRight.png +append spriteSheet.png
# magick mogrify -resize 144x144 -unsharp 1.5x1+0.7+0.02 spriteSheet.png