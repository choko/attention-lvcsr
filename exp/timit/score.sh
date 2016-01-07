#!/usr/bin/env bash
set -eu

if [ $# -ne 2 ]; then
	echo "usage: `basename $0` <part> <dir>"
	exit 1
fi

dataset=$FUEL_DATA_PATH/wsj.h5
part=$1
dir=$2

report=$dir/report.txt

# Get groundtruth
$LVSR/bin/kaldi2fuel.py $dataset read_raw_text --subset $part kaldi_text $dir/tmp
cat $dir/tmp | sort > $dir/$part-groundtruth-text.txt

# Filter decoded
$LVSR/exp/wsj/extract_for_kaldi.sh $report > $dir/tmp
cat $dir/tmp | sort > $dir/$part-decoded-text.out

# Score
compute-wer --text --mode=all ark:$dir/$part-groundtruth-text.txt ark:$dir/$part-decoded-text.out $dir/$part-text.errs > $dir/$part-text.wer
cat $dir/$part-text.wer
