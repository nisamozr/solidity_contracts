pragma solidity >=0.7.0 <0.9.0;

contract MyErc20 {
    string Name = "DELL PC";
    string Symbol = "DELL";

    mapping (address => uint256) private BalanceOf;
    mapping (address => mapping (address => uint)) allowances;
    address deployer;

    constructor(){
        deployer = msg.sender;
        BalanceOf[deployer] = 1000000 * 1e8;
    }

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    
    function name() public view returns (string memory){
        return Name;
        
    }
    
    function symbol() public view returns (string memory) {
        return Symbol;
        
    }
    
    function decimals() public pure returns (uint8) {
        return 8;
        
    }
    
    function totalSupply() public pure returns (uint256) {
        return 10000000 * 1e8;
        
    }
    
    function balanceOf(address _owner) public view returns (uint256 balance) {
       return BalanceOf[_owner];
        
    }
    
    function transfer(address _to, uint256 _value) public returns (bool success) {
        assert(BalanceOf[msg.sender] > _value);
        BalanceOf[msg.sender] = BalanceOf[msg.sender] - _value;
        BalanceOf[_to] = BalanceOf[_to]+ _value;

        emit Transfer(msg.sender, _to, _value);
        return true;

        
    }
    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        assert (BalanceOf[_from] > _value);
        if(allowances[_from][msg.sender] < _value)
            return false;
        
       

        BalanceOf[_from] -= _value;
        BalanceOf[_to] += _value;
        allowances[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);

        return true;

        
    }
    
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
        
    }
    
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowances[_owner][_spender];
    }

     mapping(uint => bool) blockMined;
    uint totalMinted = 0; 
    
    function mine() public returns(bool success){
        if(blockMined[block.number]){ // rewards of this block already mined
            return false;
        }

        
        BalanceOf[msg.sender] = BalanceOf[msg.sender] + 10*1e8;
        totalMinted = totalMinted + 10*1e8;
        blockMined[block.number] = true;
        
        return true;
    }
     function sqrt(uint x) internal returns (uint y) {
    uint z = (x + 1) / 2;
    y = x;
    while (z < y) {
        y = z;
        z = (x / z + z) / 2;
    }
    }
    
    function square(uint x) internal returns(uint) {
      return x*x;
    }

    function calculateMint(uint amountInWei) internal returns(uint) {
      return sqrt((amountInWei * 2) + square(totalMinted)) - totalMinted;
    }

    // n = number of coins returned 
    function calculateUnmint(uint n) internal returns (uint) {
        return (square(totalMinted) - square(totalMinted - n)) / 2;
    }
     function mint() public payable returns(uint){
      uint coinsToBeMinted = calculateMint(msg.value);
      assert(totalMinted + coinsToBeMinted < 10000000 * 1e8);
      totalMinted += coinsToBeMinted;
      BalanceOf[msg.sender] += coinsToBeMinted;
      return coinsToBeMinted;
    }
    
    function unmint(uint coinsBeingReturned) public payable {
      uint weiToBeReturned = calculateUnmint(coinsBeingReturned);
      assert(BalanceOf[msg.sender] > coinsBeingReturned);
      payable(msg.sender).transfer(weiToBeReturned);
      BalanceOf[msg.sender] -= coinsBeingReturned;
      totalMinted -= coinsBeingReturned;
    }
    
  
    
    
}
