pragma solidity >=0.8.0.0;

contract Election {
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    mapping(address => bool) public isVoted;

    mapping(uint256 => Candidate) public candidates;

    uint256 public candidatesCount;

    event VotedEvent(uint256 indexed candidateID);

    constructor() public {
        addCandidate('\u5317\u6d77\u9053');
        addCandidate('\u5927\u962a');
    }

    function addCandidate (string memory name) public {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount,name,0);
    }

    function vote (uint candidateID) public {
        require (!isVoted[msg.sender]);
        require (candidateID > 0 && candidateID <= candidatesCount);
        
        isVoted[msg.sender] = true;
        
        candidates[candidateID].voteCount ++;

        emit VotedEvent(candidateID);
    }

}
