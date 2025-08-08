#!/bin/bash
#SBATCH --job-name=Image_Class_Jupyter
#SBATCH --mail-type=ALL
#SBATCH --mail-user=martin.tomassi@studio.unibo.it
#SBATCH --time=120:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=60G
#SBATCH --partition=l40
#SBATCH --output=output_jupyter_exec_job_%j.txt
#SBATCH --chdir=/scratch.hpc/martin.tomassi
#SBATCH --gres=gpu:1

export JUPYTER_CONFIG_DIR="/scratch.hpc/martin.tomassi/jupyter_config_for_job_$SLURM_JOB_ID"
export MPLCONFIGDIR="/scratch.hpc/martin.tomassi/matplotlib_cache_for_job_$SLURM_JOB_ID"
mkdir -p "$JUPYTER_CONFIG_DIR"
mkdir -p "$MPLCONFIGDIR"

source venv_prj1/bin/activate
jupyter nbconvert --to notebook --execute image_class.ipynb --output image_class_trained.ipynb
jupyter nbconvert --to html image_class_trained.ipynb
deactivate

rm -rf "$JUPYTER_CONFIG_DIR"
rm -rf "$MPLCONFIGDIR"