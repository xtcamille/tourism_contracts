pragma solidity ^0.8.0;

interface ProductOracleInterface {
    struct Review {
        uint256 id;
        address reviewer;
        string content;
        uint8 rating;
    }
    
    function getReviews(uint256 productId) external view returns (Review[] memory);
} 