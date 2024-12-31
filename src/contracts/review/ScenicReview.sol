pragma solidity ^0.8.0;

import "../storage/TicketStorageInterface.sol";

contract ScenicReview {
    struct Review {
        uint256 id;
        address reviewer;
        string content;
        uint8 rating;
    }

    mapping(uint256 => Review[]) private reviews;

    TicketStorage ticketStorage;

    constructor(address ticketStorageAddress) {
        ticketStorage = TicketStorage(ticketStorageAddress);
    }

    function addReview(uint256 scenicId, string memory content, uint8 rating) public {
        require(ticketStorage.hasTicket(msg.sender), "Must have a ticket to review");
        reviews[scenicId].push(Review(reviews[scenicId].length, msg.sender, content, rating));
    }

    function getReviews(uint256 scenicId) public view returns (Review[] memory) {
        return reviews[scenicId];
    }
} 