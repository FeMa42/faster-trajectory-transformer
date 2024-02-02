#!/bin/bash
# Job name:
#SBATCH --job-name=traj-transformer
#SBATCH --account=damian
#SBATCH --partition=server02
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=30G
#SBATCH --gres=gpu:1
#SBATCH --time=90:00:00
#SBATCH --output=ttfm_test_1.txt
## Command(s) to run (example):
export PATH=/mnt/damian/miniconda3/bin:$PATH 
eval "$(conda shell.bash hook)"
conda activate ttfm
cd /mnt/damian/Projects/faster-trajectory-transformer

export LD_LIBRARY_PATH=/mnt/damian/.mujoco/mujoco210/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/nvidia
export PATH="$LD_LIBRARY_PATH:$PATH"
export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libGLEW.so
export MUJOCO_PY_MUJOCO_PATH="/mnt/damian/.mujoco/mujoco210"

python train.py --config="configs/medium/halfcheetah_medium.yaml" --device="cuda" --seed="42" 
# python train.py --config="configs/medium/halfcheetah_bullet.yaml" --device="cpu" --seed="42" 

# python eval.py --config="configs/eval_base.yaml" --device="cuda" --seed="42" checkpoints_path="pretrained/halfcheetah" beam_context=5 beam_steps=5 beam_width=32
# python eval.py --config="configs/eval_base.yaml" --device="cuda" --seed="42" checkpoints_path="checkpoints/halfcheetah-medium-v2/uniform/baseline" beam_context=5 beam_steps=5 beam_width=32

wait


