pragma solidity ^0.8.0;

import "../review/ScenicReviewInterface.sol"; // 引入景区评价合约

contract ScenicRegulation {
    struct Regulation {
        uint256 id; // 监管记录的唯一标识符
        uint256 scenicId; // 关联的景区ID
        string action; // 记录的行为（如反馈类型）
        string result; // 记录的结果（如反馈内容）
    }

    Regulation[] public regulations;
    ScenicReview scenicReview; // 景区评价合约的引用
    ScenicOracle scenicOracle; // 对外部景区评价合约的引用

    constructor(address scenicReviewAddress,address scenicOracleAddress) {
        scenicReview = ScenicReview(scenicReviewAddress); // 初始化景区评价合约的引用
        scenicOracle = ScenicOracle(scenicOracleAddress); // 初始化外部景区评价合约的引用
    }

    function reportIssue(uint256 scenicId, string memory action, string memory result) public {
        // 向监管记录中添加新条目
        regulations.push(Regulation(regulations.length, scenicId, action, result));
    }

    function reviewScenic(uint256 scenicId) public view returns (ScenicReview.Review[] memory) {
        // 获取指定景区的所有评论
        return scenicReview.getReviews(scenicId);  // 使用getReviews方法获取评论
    }

    function processReviews(uint256 scenicId) public {
        // 获取指定景点的所有评论
        ScenicReview.Review[] memory reviews = scenicReview.getReviews(scenicId);
        ScenicOracle.Review[] memory reviews2 = scenicOracle.getReviews(scenicId);
        uint256 totalRating = 0; // 初始化总评分
        uint256 reviewCount = reviews.length; // 获取评论数量
        uint256 reviewCount2 = reviews2.length; // 获取评论数量



        // 计算总评分
        for (uint256 i = 0; i < reviewCount; i++) {
            totalRating += reviews[i].rating; // 累加每条评论的评分
        }

         // 计算总评分2
        for (uint256 i = 0; i < reviewCount2; i++) {
            totalRating += reviews2[i].rating; // 累加每条评论的评分
        }

        reviewCount = reviewCount+reviewCount2;

        // 计算平均评分
        uint8 averageRating = reviewCount > 0 ? uint8(totalRating / reviewCount) : 0;

        // 根据评论数量和平均评分进行监管
        if (reviewCount >= 10) {
            if (averageRating >= 4) {
                // 如果评论数量大于等于10且平均评分大于等于4，记录积极反馈
                reportIssue(scenicId, "Positive Feedback", "Scenic spot has good reviews.");
            } else if (averageRating < 3) {
                // 如果平均评分小于3，记录负面反馈
                reportIssue(scenicId, "Negative Feedback", "Scenic spot has poor reviews.");
            }
        } else if (reviewCount < 10) {
            // 如果评论数量少于10，记录中性反馈
            reportIssue(scenicId, "Neutral Feedback", "Scenic spot has insufficient reviews.");
        }
    }
} 