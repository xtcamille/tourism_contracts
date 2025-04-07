// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface TicketStorageInterface {
    function purchaseTicket(uint256 ticketId, address seller) external;
    function redeemTicket(uint256 ticketId) external;
    function hasTicket(address user) external view returns (bool);
    function canReviewTicket(uint256 ticketId) external view returns (bool);
} 