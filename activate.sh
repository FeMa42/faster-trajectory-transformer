export PATH=/mnt/damian/miniconda3/bin:$PATH 
eval "$(conda shell.bash hook)"
conda activate ttfm
cd /mnt/damian/Projects/faster-trajectory-transformer

export LD_LIBRARY_PATH=/mnt/damian/.mujoco/mujoco210/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/nvidia
export PATH="$LD_LIBRARY_PATH:$PATH"
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libGLEW.so
export MUJOCO_PY_MUJOCO_PATH="/mnt/damian/.mujoco/mujoco210"