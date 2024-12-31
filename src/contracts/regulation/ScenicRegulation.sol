pragma solidity ^0.8.0;

import "../review/ScenicReviewInterface.sol"; // 引入景区评价合约

contract ScenicRegulation {
    struct Regulation {
        uint256 id;
        uint256 scenicId;
        string action;
        string result;
    }

    Regulation[] public regulations;
    ScenicReview scenicReview; // 景区评价合约的引用

    constructor(address scenicReviewAddress) {
        scenicReview = ScenicReview(scenicReviewAddress);
    }

    function reportIssue(uint256 scenicId, string memory action, string memory result) public {
        regulations.push(Regulation(regulations.length, scenicId, action, result));
    }

    function reviewScenic(uint256 scenicId) public view returns (ScenicReview.Review[] memory) {
        return scenicReview.getReviews(scenicId);  // Use getReviews instead of reviews
    }

    function processReviews(uint256 scenicId) public {
        ScenicReview.Review[] memory reviews = scenicReview.getReviews(scenicId);
        // 处理逻辑，例如根据评价的数量和评分进行监管
        // ... 逻辑实现 ...
    }
} 