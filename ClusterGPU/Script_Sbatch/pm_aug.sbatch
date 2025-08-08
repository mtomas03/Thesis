#!/bin/bash
#SBATCH --job-name=PM_Aug_India
#SBATCH --mail-type=ALL
#SBATCH --mail-user=martin.tomassi@studio.unibo.it
#SBATCH --time=120:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=40G
#SBATCH --partition=rtx2080
#SBATCH --output=output_jupyter_exec_job_%j.txt
#SBATCH --chdir=/scratch.hpc/martin.tomassi
#SBATCH --gres=gpu:1

export JUPYTER_CONFIG_DIR="/scratch.hpc/martin.tomassi/jupyter_config_for_job_$SLURM_JOB_ID"
export MPLCONFIGDIR="/scratch.hpc/martin.tomassi/matplotlib_cache_for_job_$SLURM_JOB_ID"
mkdir -p "$JUPYTER_CONFIG_DIR"
mkdir -p "$MPLCONFIGDIR"

source venv_pm_aug/bin/activate
jupyter nbconvert --to notebook --execute 5_Training_Evaluation_India_Aug.ipynb --output 5_Training_Evaluation_India_Aug_trained.ipynb
jupyter nbconvert --to html 5_Training_Evaluation_India_Aug_trained.ipynb
deactivate

rm -rf "$JUPYTER_CONFIG_DIR"
rm -rf "$MPLCONFIGDIR"