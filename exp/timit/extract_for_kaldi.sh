#!/usr/bin/env bash

#
# Extract transcripts to score using kaldi's compute-wer program
# transcript sanitization rules taken from the Kaldi WSJ s5 recipe are applied
#

paste -d ' '\
 <( cat $1 | grep Utterance | sed 's/.*(\(.*\))/\1/' )\
 <( cat $1 | grep Recognized: | sed 's/Recognized: \(.*\)/\1/' )

