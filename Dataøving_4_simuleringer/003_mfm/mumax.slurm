#!/usr/bin/bash
#SBATCH --partition=GPUQ
#SBATCH --account=nv-fys
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1
#SBATCH --job-name="mumax3"
#SBATCH --output=geometry.%j.out

cd $SLURM_SUBMIT_DIR
module purge
module load mumax3/10-NVHPC-22.7-CUDA-11.7.0
mumax3 run.mx3
mumax3-convert -png run.out/*.ovf
