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

//Write code here

}
