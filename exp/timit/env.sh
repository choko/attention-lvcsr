#!/bin/bash

export PATH="/home/klejch/bin/:$PATH"
export PATH="/ha/work/people/klejch/kams/kaldi/src/bin/:$PATH"
export PATH="/ha/work/people/klejch/kams/kaldi/src/featbin/:$PATH"
export PATH="/ha/work/people/klejch/kams/kaldi/egs/wsj/s5/utils/:$PATH"
export PATH="/ha/work/people/klejch/kaldi-python/scripts/:$PATH"
export PATH="/usr/local/cuda-6.5/bin/:$PATH"

export LD_LIBRARY_PATH="/ha/work/people/klejch/kams/kaldi/tools/openfst/lib/:/ha/work/people/klejch/kams/kaldi/tools/openfst/lib/fst/:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/ha/work/people/klejch/kaldi-python/kaldi_io:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-6.5/lib64/:$LD_LIBRARY_PATH"

export CUDA_VISIBLE_DEVICES=1
export THEANO_FLAGS="floatX=float32,device=gpu,nvcc.fastmath=True,compiledir=./compile_dir"
export FUEL_DATA_PATH='/ha/work/people/klejch/attention-lvcsr/exp/timit/'
export TIMIT_S5=/ha/work/people/klejch/kams/kaldi/egs/timit/s5/

export LVSR=/ha/work/people/klejch/attention-lvcsr
source $LVSR/env.sh
