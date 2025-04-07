pragma solidity ^0.8.0;

import "../storage/TicketStorageInterface.sol";

contract ScenicReview {
    // 定义评论结构体
    struct Review {
        uint256 id; // 评论的唯一标识符
        address reviewer; // 评论者的地址
        string content; // 评论内容
        uint8 rating; // 评论评分
    }

    // 存储每个景点的评论列表
    mapping(uint256 => Review[]) private reviews;

    TicketStorage ticketStorage; // 票务存证合约的引用

    // 构造函数，初始化票务存证合约的地址
    constructor(address ticketStorageAddress) {
        ticketStorage = TicketStorage(ticketStorageAddress);
    }

    // 添加评论的函数
    function addReview(uint256 scenicId, string memory content, uint8 rating) public {
        // 确保评论者拥有有效的票据
        require(ticketStorage.hasTicket(msg.sender), "Must have a ticket to review");
        // 将新评论添加到指定景点的评论列表中
        reviews[scenicId].push(Review(reviews[scenicId].length, msg.sender, content, rating));
    }

    // 获取指定景点的所有评论
    function getReviews(uint256 scenicId) public view returns (Review[] memory) {
        return reviews[scenicId]; // 返回该景点的评论列表
    }
} 