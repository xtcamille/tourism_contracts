pragma solidity ^0.8.0;

contract ScenicOracle {
    // 定义评价结构体
    struct Review {
        uint256 scenicId; // 评论的唯一标识符
        string reviewer; // 评价者的名称
        uint8 rating; // 评分
        string comment; // 评价内容
    }

    // 存储所有评价的映射
    mapping(uint256 => Review[]) public scenicReviews;

    // 提交评价的事件
    event ReviewSubmitted(uint256 indexed scenicId, string reviewer, uint8 rating, string comment);

    // 提交评价的函数
    function submitReview(uint256 scenicId, string memory reviewer, uint8 rating, string memory comment) public {
        require(rating >= 1 && rating <= 5, "Rating must be between 1 and 5."); // 验证评分范围

        // 创建新的评价并存储
        Review memory newReview = Review(scenicId, reviewer, rating, comment);
        scenicReviews[scenicId].push(newReview);

        // 触发事件
        emit ReviewSubmitted(scenicId, reviewer, rating, comment);
    }

    // 获取指定景区的所有评价
    function getReviews(uint256 scenicId) public view returns (Review[] memory) {
        return scenicReviews[scenicId];
    }
}