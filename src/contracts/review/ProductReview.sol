pragma solidity ^0.8.0;

import "../storage/ProductStorageInterface.sol";

contract ProductReview {
    struct Review {
        uint256 id;
        address reviewer;
        string content;
        uint8 rating;
    }

    mapping(uint256 => Review[]) public reviews;

    ProductStorage productStorage; // 产品存证合约的引用

    constructor(address productStorageAddress) {
        productStorage = ProductStorage(productStorageAddress);
    }

    function addReview(uint256 productId, string memory content, uint8 rating) public {
        require(productStorage.canReviewProduct(msg.sender), "Must have purchased the product to review");
        reviews[productId].push(Review(reviews[productId].length, msg.sender, content, rating));
    }

    function getReviews(uint256 productId) public view returns (Review[] memory) {
        return reviews[productId];
    }
} 