pragma solidity ^0.8.0;

contract ProductStorage {
    struct Product {
        uint256 id;
        string name;
        address seller;
    }

    mapping(uint256 => Product) public products;

    function addProduct(uint256 productId, string memory name) public {
        products[productId] = Product(productId, name, msg.sender);
    }

    function purchaseProduct(uint256 productId) public {
        // 购买逻辑
    }

    function canReviewProduct(address user) public view returns (bool) {
        // 检查用户是否有购买记录
        // ... 逻辑实现 ...
    }
} 