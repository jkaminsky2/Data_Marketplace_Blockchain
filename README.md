# Data Marketplace Blockchain

<a target="_blank" href="https://cookiecutter-data-science.drivendata.org/">
    <img src="https://img.shields.io/badge/CCDS-Project%20template-328F97?logo=cookiecutter" />
</a>

This repo contains the back-end code for a decentralized application (dapp), specifically a data marketplace, on the Ethereum Blockchain. To access, go to [https://jkaminsky2.github.io/Data_Marketplace_Blockchain/](https://jkaminsky2.github.io/Data_Marketplace_Blockchain/). Users can buy/sell data securely and in accordance with privacy laws. To begin, launch the website attached to this repository. Users, after registering for an account, can upload data to an offshore, decentralized storage location (IPFS) and post it to the market--along with an overview of the data–general tags like industry, description of what data is about, dataset size, and a column-by-column description; before the data is stored, the data is encrypted, has a script `malware_and_pii.py` run on it to anonymize the data and ensure no malware is present; then the dataset is tagged with a certification so that other users cannot upload the same data. Buyers can see this information and filter data based on their needs. Buyers then purchase desirable data with our token via smart contracts, along with paying a little extra gas to nodes to verify the transaction and upload it to the blockchain via Polygon. Buyers and sellers can also exchange services to run analytics on the data–or any data they have in-house. We will also offer our own service that offers a wide variety of ML applications, like data summarization and image description generation. Our focus is on ensuring a safe and secure platform, where the ML applications are secondary.

To run `malware_and_pii` (while this is encoded in the smart contract, meaning you would typically not run it on its own, this would be how you would test the code on a csv file), you need the following libraries (which are incuded in the `requirements.txt` file: `requests`, `json`, `pandas`, `re`, `argparse`, and `spacy`. Then download the repo locally and run the following in your terminal: python3 /path/malware_and_pii.py /path/csv_file_to_check.csv



## Project Organization

```
├── LICENSE            <- Open-source license if one is chosen
├── Makefile           <- Makefile with convenience commands like `make data` or `make train`
├── README.md          <- The top-level README for developers using this project.
├── data
│   ├── external       <- Data from third party sources.
│   ├── interim        <- Intermediate data that has been transformed.
│   ├── processed      <- The final, canonical data sets for modeling.
│   └── raw            <- The original, immutable data dump.
│
├── docs               <- A default mkdocs project; see www.mkdocs.org for details
│
├── models             <- Trained and serialized models, model predictions, or model summaries
│
├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
│                         the creator's initials, and a short `-` delimited description, e.g.
│                         `1.0-jqp-initial-data-exploration`.
│
├── pyproject.toml     <- Project configuration file with package metadata for 
│                         data_marketplace_blockchain and configuration for tools like black
│
├── references         <- Data dictionaries, manuals, and all other explanatory materials.
│
├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
│   └── figures        <- Generated graphics and figures to be used in reporting
│
├── requirements.txt   <- The requirements file for reproducing the analysis environment, e.g.
│                         generated with `pip freeze > requirements.txt`
│
├── setup.cfg          <- Configuration file for flake8
│
└── data_marketplace_blockchain   <- Source code for use in this project.
    │
    ├── __init__.py             <- Makes data_marketplace_blockchain a Python module
    │
    ├── config.py               <- Store useful variables and configuration
    │
    ├── dataset.py              <- Scripts to download or generate data
    │
    ├── features.py             <- Code to create features for modeling
    │
    ├── modeling                
    │   ├── __init__.py 
    │   ├── predict.py          <- Code to run model inference with trained models          
    │   └── train.py            <- Code to train models
    │
    └── plots.py                <- Code to create visualizations
```

--------

