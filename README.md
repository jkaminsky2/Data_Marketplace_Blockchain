# Data Marketplace Blockchain

**Project website:** https://suaye07.github.io/DSC180_proj_web/

<a target="_blank" href="https://cookiecutter-data-science.drivendata.org/">
    <img src="https://img.shields.io/badge/CCDS-Project%20template-328F97?logo=cookiecutter" />
</a>

This repo contains the back-end code for a decentralized application (dapp), specifically a data marketplace, on the Ethereum Blockchain. To access, go to https://suaye07.github.io/DSC180_proj_web/. Users can buy and sell data securely and in accordance with privacy laws; there are also on-chain data analytics capabilities. To begin, launch the website attached to this repository. Users, after registering for an account, can upload data to an offshore, decentralized storage location (IPFS) via `Ddm.sol` and post it to the market--along with an overview of the data–general tags like industry, description of what data is about, dataset size, and a column-by-column description; before the data is stored, the data is encrypted, has a script `malware_and_pii.py` run on it to anonymize the data and ensure no malware or SQL injections are present; then the dataset is tagged with a certification so that other users cannot upload the same data. Buyers can see this information and filter data based on their needs. Buyers then purchase desirable data with our token via smart contracts, along with paying a little extra gas to nodes to verify the transaction and upload it to the blockchain via Polygon. Buyers and sellers can also exchange services to run analytics on the data–or any data they have in-house. We will also offer our own service that offers a wide variety of ML applications, like data summarization and image description generation, and allow users to upload scripts. These analytics can be run on-chain for secure, transparent data analysis without compromising privacy. Our focus is on ensuring a safe and secure platform, where the ML applications are secondary.

To look at the smart contract `Ddm.sol`, navigate to` data_marketplace_blockchain` folder. You will use this contract to upload, buy, and sell data and data analytic scripts. To use the script, go to the website (still in progress connecting the script to the website). 

To run `malware_and_pii` (while this is encoded in the smart contract, meaning you would typically not run it on its own, this would be how you would test the code on a csv file), you need the following libraries (which are incuded in the `requirements.txt` file: `requests`, `json`, `pandas`, `re`, `argparse`, and `spacy`. Then download the repo locally and run the following in your terminal: python3 /path/malware_and_pii.py /path/csv_file_to_check.csv

### IPFS - Instrcutions for upload and fetch demo

Create the directory and install library

mkdir piñata-demo && cd piñata-demo && npm init -y
npm install @pinata/sdk
npm install piñata

Add sample file for upload

echo example>h.txt

Add require file for fetch and upload, then paste the code to these two file

echo a>fetch.js 
Echo a>upload.js

Upload.js
Change the PINATA_JWT,GATEWAY_URL from your account
Change the blob and file to the file you want to upload

Call node upload.js to run

It should return
{
  id: '0192f5f6-a551-79d5-8dc9-87408d477aca',
  name: 'h.txt',
  cid: 'bafkreiatkubvbkdidscmqynkyls3iqawdqvthi7e6mbky2amuw3inxsi3y',
  created_at: '2024-11-04T06:57:15.754Z',
  size: 8,
  number_of_files: 1,
  mime_type: 'text/plain',
  user_id: '069409e4-03da-4325-b61d-59cf8ddcd452'
}

Fetch.js
Change the PINATA_JWT,GATEWAY_URL from your account
Change the cid to file you want to fetch

Call node fetch.js

It will return the data in file and type


## Project Organization

```
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
├── notebooks          <- Jupyter notebooks and .py files. Naming convention is a number (for ordering),
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
├── index.html          <- Main page for webpage
│
└── data_marketplace_blockchain   <- Source code for use in this project.
    └── Dmd.sol        <- Smart contract to upload, buy, and sell data and data analytic scripts.
```

--------

