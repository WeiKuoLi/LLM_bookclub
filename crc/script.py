import torch

import os
from datasets import load_dataset, DatasetDict

# Define the directory to save/load the datasets
local_dataset_dir = "/scratch365/wli22/local_datasets"

print("start downloading")
# Check if the local dataset directory exists
if os.path.exists(local_dataset_dir):
    # Load datasets from the local directory
    raw_datasets = DatasetDict.load_from_disk(local_dataset_dir)
    print("Datasets loaded from the local directory.")
else:
    # Load datasets from the Hugging Face repository
    ds_train = load_dataset("huggingface-course/codeparrot-ds-train", split="train")
    ds_valid = load_dataset("huggingface-course/codeparrot-ds-valid", split="validation")

    # Create a DatasetDict
    raw_datasets = DatasetDict(
        {
            "train": ds_train,
            "valid": ds_valid,
        }
    )

    # Save datasets to the local directory
    raw_datasets.save_to_disk(local_dataset_dir)
    print("Datasets saved to the local directory.")
