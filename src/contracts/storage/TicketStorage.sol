pragma solidity ^0.8.0;

contract TicketStorage {
    // 定义门票结构
    struct Ticket {
        uint256 id;            // 门票的唯一标识符
        address buyer;         // 买家的地址
        bool isUsed;          // 门票是否已被使用
        uint256 purchaseTime;  // 购买时间戳
        address seller;        // 卖方地址
        uint256 redeemTime;    // 核销时间戳
    }

    mapping(uint256 => Ticket) public tickets; // 存储门票的映射，使用门票ID作为键
    uint256[] public ticketIds; // 存储所有门票的ID，以便遍历

    // 购买门票
    function purchaseTicket(uint256 ticketId, address seller) public {
        // 初始化门票并将其添加到映射中
        tickets[ticketId] = Ticket(ticketId, msg.sender, false, block.timestamp, seller, 0); // msg.sender为买家地址，核销时间初始为0
        ticketIds.push(ticketId); // 添加新门票ID到数组
    }

    // 核销门票
    function redeemTicket(uint256 ticketId) public {
        require(tickets[ticketId].buyer == msg.sender, "Not the ticket owner"); // 检查调用者是否是门票的买家
        require(!tickets[ticketId].isUsed, "Ticket already used"); // 确保门票尚未使用
        
        tickets[ticketId].isUsed = true; // 设置门票为已使用
        tickets[ticketId].redeemTime = block.timestamp; // 设置核销时间为当前时间
    }

    // 检查用户是否拥有有效的门票
    function hasTicket(address user) public view returns (bool) {
        for (uint256 i = 0; i < ticketIds.length; i++) {
            // 遍历所有门票，检查用户是否拥有未使用的门票
            if (tickets[ticketIds[i]].buyer == user && !tickets[ticketIds[i]].isUsed) {
                return true; // 找到有效的门票，返回true
            }
        }
        return false; // 没有找到有效的门票，返回false
    }

    // 检查用户是否具有评价的权限
    function canReviewTicket(uint256 ticketId, address user) public view returns (bool) {
        // 检查用户是否是门票的买家，并且门票已被核销
        return tickets[ticketId].buyer == user && tickets[ticketId].isUsed;
    }
} 