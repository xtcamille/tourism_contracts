// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ProductStorage {
    function canReviewProduct(address reviewer) external view returns (bool);
} 