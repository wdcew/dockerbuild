#!/usr/bin/env bash
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
		. "/opt/anaconda/etc/profile.d/conda.sh"
	else
		export PATH="/opt/anaconda/bin:$PATH"
	fi
fi
unset __conda_setup
# <<< conda initialize <<<

conda activate deepfacelab
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib
cd ..
export DFL_PYTHON="python3.7"
export DFL_WORKSPACE="workspace/"

if [ ! -d "$DFL_WORKSPACE" ]; then
    mkdir "$DFL_WORKSPACE"
    mkdir "$DFL_WORKSPACE/data_src"
    mkdir "$DFL_WORKSPACE/data_src/aligned"
    mkdir "$DFL_WORKSPACE/data_src/aligned_debug"
    mkdir "$DFL_WORKSPACE/data_dst"
    mkdir "$DFL_WORKSPACE/data_dst/aligned"
    mkdir "$DFL_WORKSPACE/data_dst/aligned_debug"
    mkdir "$DFL_WORKSPACE/model"
fi

export DFL_ROOT="./"
export DFL_SRC="./DeepFaceLab"

export OPENBLAS_NUM_THREADS=2
export GOTO_NUM_THREADS=2
export OMP_NUM_THREADS=2
