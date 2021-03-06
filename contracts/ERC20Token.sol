//SPDX-License-Identifier: UNLICENSED 
pragma solidity >=0.5.0 <0.9.0;

interface IERC20 { 

    function totalSupply() external view returns (uint256);
    function balanceOf(address tokenOwner) external view returns (uint256 balance);
    function transfer(address to, uint256 tokens) external returns (bool success);
    function allowance(address tokenOwner, address spender) external view returns (uint256 remaining);
    function approve(address spender, uint256 tokens) external returns (bool success);
    function transferFrom(address from,address to,uint256 tokens) external returns (bool success);

    event Transfer(address indexed from, address indexed to, uint256 tokens);
    event Approval(address indexed tokenOwner,address indexed spender,uint256 tokens);
}

contract ERC20Token is IERC20 { 

    string public name; 
    string public symbol; 
    uint8 public decimals; 
    uint256 public _totalSupply; 
    mapping(address => uint256) public totalBalance; 
    mapping(address => mapping(address => uint256)) public allow;

    constructor(string memory _name,string memory _symbol,uint8 _decimals,uint256 __totalSupply) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        _totalSupply = __totalSupply;
        totalBalance[msg.sender] = _totalSupply;
    }

    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }
    
    function balanceOf(address addr) public view override returns (uint256) {
        return totalBalance[addr];
    }

    function transfer(address to, uint256 amount)public override returns (bool){
    require(totalBalance[msg.sender] >= amount, "not sufficient balance");
    totalBalance[msg.sender] -= amount;
    totalBalance[to] += amount;
    emit Transfer(msg.sender, to, amount);
    return true;
}

     
    function approve(address spender, uint256 amount) public override returns (bool){
        require(totalBalance[msg.sender]>=amount);
        require(amount>0);
        allow[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function allowance(address owner, address spender) public view override returns (uint256){
        return allow[owner][spender];
    }

    function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
        require(allow[from][msg.sender] >= amount, "allowance too low");
        require(totalBalance[from] >= amount, "amount to be sent should be less than total balance");
        allow[from][msg.sender] -= amount; 
        totalBalance[from] -= amount;
        totalBalance[to] += amount;
        emit Transfer(from, to, amount);
        return true;
    }

    

    

    

    

}