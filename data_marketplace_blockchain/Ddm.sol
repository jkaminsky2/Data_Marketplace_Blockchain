// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title DataMarketplace
 * @dev A decentralized marketplace for buying and selling datasets.
 * Providers can list datasets for sale, and buyers can purchase access to those datasets.
 */
contract DataMarketplace {
    /**
     * @dev Represents a dataset available for purchase.
     * @param provider The address of the dataset provider.
     * @param description A brief description of the dataset.
     * @param price The price (in wei) of the dataset.
     * @param encryptedOffChainUri The URI pointing to the encrypted off-chain data.
     */
    struct DataSet {
        address provider;
        string description;
        uint256 price;
        string encryptedOffChainUri;
    }

    // Mapping to store datasets by their unique ID
    mapping(uint256 => DataSet) public dataSets;
    // Counter to keep track of the number of datasets
    uint256 public dataSetCounter;
    
    // Mapping to store the addresses of buyers for each dataset
    mapping(uint256 => address[]) public dataBuyers;

    // Event emitted when a new dataset is added
    event DataSetAdded(uint256 indexed dataSetId, address indexed provider, string description, uint256 price);
    // Event emitted when a dataset is purchased
    event DataSetPurchased(uint256 indexed dataSetId, address indexed buyer);

    /**
     * @dev Modifier to ensure that only the provider of a dataset can perform certain actions.
     * @param _dataSetId The ID of the dataset.
     */
    modifier onlyProvider(uint256 _dataSetId) {
        require(msg.sender == dataSets[_dataSetId].provider, "Only provider can perform this action");
        _;
    }

    /**
     * @dev Modifier to ensure that only a buyer of a dataset can access certain data.
     * @param _dataSetId The ID of the dataset.
     */
    modifier onlyBuyer(uint256 _dataSetId) {
        bool isBuyer = false;
        for (uint256 i = 0; i < dataBuyers[_dataSetId].length; i++) {
            if (dataBuyers[_dataSetId][i] == msg.sender) {
                isBuyer = true;
                break;
            }
        }
        require(isBuyer, "Only buyer can access this data");
        _;
    }

    /**
     * @dev Adds a new dataset to the marketplace.
     * @param _description A brief description of the dataset.
     * @param _price The price (in wei) of the dataset.
     * @param _encryptedOffChainUri The URI pointing to the encrypted off-chain data.
     */
    function addDataSet(string memory _description, uint256 _price, string memory _encryptedOffChainUri) public {
        require(bytes(_encryptedOffChainUri).length > 0, "Invalid data URI");
        
        dataSets[dataSetCounter] = DataSet({
            provider: msg.sender,
            description: _description,
            price: _price,
            encryptedOffChainUri: _encryptedOffChainUri
        });

        // Emit an event indicating that a new dataset has been added
        emit DataSetAdded(dataSetCounter, msg.sender, _description, _price);
        dataSetCounter++;
    }

    /**
     * @dev Purchases a dataset from the marketplace.
     * The buyer must send the exact price of the dataset in wei.
     * @param _dataSetId The ID of the dataset to be purchased.
     */
    function purchaseDataSet(uint256 _dataSetId) public payable {
        DataSet storage dataSet = dataSets[_dataSetId];
        require(_dataSetId < dataSetCounter, "DataSet does not exist");
        require(msg.value == dataSet.price, "Incorrect payment amount");
        
        // Transfer the funds to the provider
        payable(dataSet.provider).transfer(msg.value);
        
        dataBuyers[_dataSetId].push(msg.sender);
        
        // Emit an event indicating that the dataset has been purchased
        emit DataSetPurchased(_dataSetId, msg.sender);
    }

    /**
     * @dev Returns the URI of the purchased dataset.
     * Only a buyer of the dataset can access this URI.
     * @param _dataSetId The ID of the dataset.
     * @return The encrypted URI of the off-chain data.
     */
    function getDataSetUri(uint256 _dataSetId) public view onlyBuyer(_dataSetId) returns (string memory) {
        return dataSets[_dataSetId].encryptedOffChainUri;
    }
}
