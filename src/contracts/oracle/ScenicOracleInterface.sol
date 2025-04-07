pragma solidity ^0.8.0;


interface ScenicOracleInterface {
    struct Review {
        uint256 id;
        address reviewer;
        string content;
        uint8 rating;
    }
    
    function getReviews(uint256 id) external view returns (Review[] memory);
} 