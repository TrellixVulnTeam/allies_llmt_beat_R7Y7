#! /bin/bash

echo "Updating conda if necessary"
conda update -n base conda
conda config --set show_channel_urls True

echo "This will create a python env named 'beat_allies' and install the necessary tools for LLMT"
read -n 1 -p "Proceed? [y/n]" choice
case "$choice" in 
  y|Y ) echo "Let's go!";;
  n|N ) echo "Quitting..."; exit 1;;
  * ) echo "invalid input"; exit 1;;
esac

conda env create -f environment.yml
conda activate beat_allies

echo "Installing third party tools: nmtpytorch sacrebleu"
read -n 1 -p "Proceed? [y/n]" choice
case "$choice" in 
  y|Y ) echo "Let's go!";;
  n|N ) echo "Quitting..."; exit 1;;
  * ) echo "invalid input"; exit 1;;
esac

cd nmtpytorch
python setup.py develop
cd ..

cd sacrebleu
python setup.py install
cd ..

echo "You can run the baseline system with the following command:"
echo "beat --prefix `pwd`/beat exp run loicbarrault/loicbarrault/translation_ll_dev/1/translation_ll_dev"
echo "(be sure to export CUDA_VISIBLE_DEVICES=X where X is the GPU you want to use)"






