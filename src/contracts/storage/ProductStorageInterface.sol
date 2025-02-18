// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ProductStorage {
    function canReviewProduct(uint256 productId) external view returns (bool);
} 