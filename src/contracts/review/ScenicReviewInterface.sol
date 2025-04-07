// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ScenicReviewInterface {
    struct Review {
        uint256 id;
        address reviewer;
        string content;
        uint8 rating;
    }
    
    function getReviews(uint256 scenicId) external view returns (Review[] memory);
    function addReview(uint256 scenicId, string memory content, uint8 rating) external;
} 