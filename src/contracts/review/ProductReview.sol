pragma solidity ^0.8.0;

import "../storage/ProductStorageInterface.sol";

contract ProductReview {
    // 定义评论结构体
    struct Review {
        uint256 id; // 评论的唯一标识符
        address reviewer; // 评论者的地址
        string content; // 评论内容
        uint8 rating; // 评论评分
    }

    // 存储每个产品的评论列表
    mapping(uint256 => Review[]) public reviews;

    ProductStorage productStorage; // 产品存证合约的引用

    // 构造函数，初始化产品存证合约的地址
    constructor(address productStorageAddress) {
        productStorage = ProductStorage(productStorageAddress);
    }

    // 添加评论的函数
    function addReview(uint256 productId, string memory content, uint8 rating) public {
        // 确保评论者已购买该产品
        require(productStorage.canReviewProduct(productId,msg.sender), "Must have purchased the product to review");
        // 将新评论添加到指定产品的评论列表中
        reviews[productId].push(Review(reviews[productId].length, msg.sender, content, rating));
    }

    // 获取指定产品的所有评论
    function getReviews(uint256 productId) public view returns (Review[] memory) {
        return reviews[productId]; // 返回该产品的评论列表
    }
} 