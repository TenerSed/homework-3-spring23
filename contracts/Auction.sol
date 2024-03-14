// SPDX - License - Identifier : MIT
pragma solidity ^0.8.20;

contract Auction {
    address payable public beneficiary ;
    uint256 public minimumBid ;
    address public maxBidder ;
    bool public auctionEnded ;

    // Constructor
    constructor ( uint256 _minimumBid , address payable _beneficiaryAddress ) {
        // TODO : Initialize the contract
    }

    // Function to place a bid
    function bid () external payable {
        // TODO : Implement the bid function
    }

    // Function to end the auction
    function settleAuction () external {
        // TODO : Implement the settleAuction function
    }

}