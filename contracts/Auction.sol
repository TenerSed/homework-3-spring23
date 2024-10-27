// SPDX - License - Identifier : MIT
pragma solidity ^0.8.20;

contract Auction {
    address payable public beneficiary ;
    uint256 public minimumBid ;
    address public maxBidder ;
    bool public auctionEnded ;
    uint256 public highestBid ;
    bool public anyBids ;


    // Constructor
    constructor ( uint256 _minimumBid , address payable _beneficiaryAddress ) {
        minimumBid = _minimumBid;
        beneficiary = _beneficiaryAddress;
        auctionEnded = false;
        highestBid = 0;
        anyBids = false;
    }

    // Function to place a bid
    function bid () external payable {
        require(!auctionEnded, "Auction has ended.");
        require(msg.sender != beneficiary, "Beneficiary cannot bid.");
        require(msg.sender != maxBidder, "You are already the highest bidder.");
        require(msg.value >= minimumBid, "Bid is below the minimum bid.");

        // Refund the previous highest bidder
        if (minimumBid != 0) {
            payable(maxBidder).transfer(highestBid);
        }

        maxBidder = msg.sender;
        highestBid = msg.value;
        minimumBid = msg.value;
    }

    // Function to end the auction
    function settleAuction () external {
        require(!auctionEnded, "Auction has already been settled.");
        require(msg.sender == beneficiary, "Only the beneficiary can end the auction.");

        if (!anyBids) {
            maxBidder = beneficiary;
        }

        // End the auction and transfer funds to the beneficiary
        auctionEnded = true;
        if (highestBid > 0) {
            beneficiary.transfer(highestBid);
        }
    }   

}