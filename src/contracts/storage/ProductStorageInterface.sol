// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ProductStorageInteface {
    function canReviewProduct(uint256 productId, address user) external view returns (bool);
} 