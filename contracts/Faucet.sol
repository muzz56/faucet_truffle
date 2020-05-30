pragma solidity >=0.5.0 <0.7.0;


contract Faucet {
    event Withdraw(address indexed, uint256 indexed);
    event Deposit(address indexed, uint256 indexed);

    function withdraw(uint256 _amount) public payable {
        //check the balance and retrict the value of ether
        require(
            address(this).balance >= _amount,
            "Faucet.sol: Insufficient Funds."
        );
        require(
            _amount <= 0.1 ether,
            "Faucet.sol: Cannot withdraw more than 0.1."
        );
        msg.sender.transfer(_amount);
        emit Withdraw(msg.sender, _amount);
    }

    function() external payable {
        emit Deposit(msg.sender, msg.value);
    }
}
