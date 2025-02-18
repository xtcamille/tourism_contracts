pragma solidity ^0.8.0;

import "../review/ProductReviewInterface.sol";  // Update this line

contract ProductRegulation {
    // 定义监管结构体
    struct Regulation {
        uint256 id; // 监管记录的唯一标识符
        uint256 productId; // 关联的产品ID
        string action; // 监管行动的描述
        string result; // 监管结果的描述
    }

    Regulation[] public regulations; // 存储所有监管记录的数组
    ProductReview productReview; // 产品评价合约的引用

    // 构造函数，初始化产品评价合约的地址
    constructor(address productReviewAddress) {
        productReview = ProductReview(productReviewAddress);
    }

    // 报告问题的函数
    function reportIssue(uint256 productId, string memory action, string memory result) public {
        // 将新的监管记录添加到数组中
        regulations.push(Regulation(regulations.length, productId, action, result));
    }

    // 获取指定产品的所有评论
    function reviewProduct(uint256 productId) public view returns (ProductReview.Review[] memory) {
        return productReview.getReviews(productId); // 返回该产品的评论列表
    }

    // 处理评论的函数
    function processReviews(uint256 productId) public {
        // 获取指定产品的所有评论
        ProductReview.Review[] memory reviews = productReview.getReviews(productId);
        uint256 totalRating = 0; // 初始化总评分
        uint256 reviewCount = reviews.length; // 获取评论数量

        // 计算总评分
        for (uint256 i = 0; i < reviewCount; i++) {
            totalRating += reviews[i].rating; // 累加每条评论的评分
        }

        // 计算平均评分
        uint8 averageRating = reviewCount > 0 ? uint8(totalRating / reviewCount) : 0;

        // 根据评论数量和平均评分进行监管
        if (reviewCount >= 10) {
            if (averageRating >= 4) {
                // 如果评论数量大于等于10且平均评分大于等于4，记录积极反馈
                reportIssue(productId, "Positive Feedback", "Product has good reviews.");
            } else if (averageRating < 3) {
                // 如果平均评分小于3，记录负面反馈
                reportIssue(productId, "Negative Feedback", "Product has poor reviews.");
            }
        } else if (reviewCount < 10) {
            // 如果评论数量少于10，记录中性反馈
            reportIssue(productId, "Neutral Feedback", "Product has insufficient reviews.");
        }
    }
}