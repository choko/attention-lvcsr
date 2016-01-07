#!/bin/bash

kaldi=/ha/work/people/klejch/kams/kaldi/
timit=/a/merkur2/vystadial/speech-corpora/en/TIMIT_Acoustic-Phonetic_Cont.Speech_Corpus_LDC93S1/timit/TIMIT

cd $kaldi/egs/timit/s5
pwd

local/timit_data_prep.sh $timit || exit 1

local/timit_prepare_dict.sh

# Caution below: we remove optional silence by setting "--sil-prob 0.0",
# in TIMIT the silence appears also as a word in the dictionary and is scored.
utils/prepare_lang.sh --sil-prob 0.0 --position-dependent-phones false --num-sil-states 3 \
  data/local/dict "sil" data/local/lang_tmp data/lang

local/timit_format_data.sh
