pragma solidity ^0.4.0;

contract Order {

    address public Owner;
    address public AddresExecuter;
    bool executerApprove;
    address[3] public Auditors;
    mapping(address => uint) public Votes;

    uint public FinishTime;
    string public DocsHash;

    constructor(address owner, address addresExecuter,address[3] auditors, uint finishTime, string docsHash) public payable{

        Owner = owner;
        AddresExecuter = addresExecuter;
        Auditors = auditors;
        FinishTime = finishTime;
        DocsHash = docsHash;

        for (uint i = 0; i < 3 ; i++) {
            Votes[Auditors[i]] = 0;
        }
           
    }

    function pay(bool approve) public  { // действие заказчика
        require(approve);
        AddresExecuter.transfer(address(this).balance);
    }

    function approve() public { // действие исполнителя
        executerApprove = true;
        FinishTime = now + FinishTime;
    }

    function auditorVote(uint vote) public { // действие аудитора
        Votes[msg.sender] = vote;
    }

    function reject() public { // действие заказчика и исполнителя

        if(checkAuditorsDecisions()){
            AddresExecuter.transfer(address(this).balance);
        }

        if(now > FinishTime) {
            Owner.transfer(address(this).balance);
        }


    }

    function checkAuditorsDecisions() private returns (bool success) {
        for(uint i = 0; i < 3 ; i++) {
            if(Votes[Auditors[i]] == 1)
                return false;
        }
        return true;
    }

}
