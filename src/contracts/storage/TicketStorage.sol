pragma solidity ^0.8.0;

contract TicketStorage {
    struct Ticket {
        uint256 id;
        address buyer;
        bool isUsed;
    }

    mapping(uint256 => Ticket) public tickets;

    function purchaseTicket(uint256 ticketId) public {
        tickets[ticketId] = Ticket(ticketId, msg.sender, false);
    }

    function useTicket(uint256 ticketId) public {
        require(tickets[ticketId].buyer == msg.sender, "Not the ticket owner");
        require(!tickets[ticketId].isUsed, "Ticket already used");
        tickets[ticketId].isUsed = true;
    }

    function hasTicket(address user) public view returns (bool) {
        // 检查用户是否有有效的门票
        // ... 逻辑实现 ...
    }
} 