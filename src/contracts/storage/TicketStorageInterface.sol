// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface TicketStorage {
    function hasTicket(address visitor) external view returns (bool);
       function purchaseTicket(uint256 ticketId) external;
    function useTicket(uint256 ticketId) external;
} 