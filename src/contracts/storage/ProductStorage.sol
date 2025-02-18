pragma solidity ^0.8.0;

contract ProductStorage {
    // 定义产品结构
    struct Product {
        uint256 id;        // 产品的唯一标识符
        string name;      // 产品名称
        address seller;   // 卖家的地址
        address buyer;    // 买家的地址，初始为零地址表示尚未被购买
    }

    // 产品ID到产品的映射
    mapping(uint256 => Product) public products;

    // 添加新产品
    function addProduct(uint256 productId, string memory name) public {
        // 初始化产品并将其添加到映射中
        products[productId] = Product(productId, name, msg.sender, address(0)); // msg.sender为卖家地址，buyer初始为零地址
    }

    // 购买产品
    function purchaseProduct(uint256 productId) public {
        // 检查产品是否已被购买
        require(products[productId].buyer == address(0), "Product already purchased");
        // 确保卖家不能购买自己的产品
        require(products[productId].seller != msg.sender, "Seller cannot purchase their own product");
        // 设置买家为当前调用者的地址
        products[productId].buyer = msg.sender;
    }

    // 检查用户是否可以评论产品
    function canReviewProduct(uint256 productId, address user) public view returns (bool) {
        // 返回调用者是否是该产品的买家
        return products[productId].buyer == user;
    }
} 