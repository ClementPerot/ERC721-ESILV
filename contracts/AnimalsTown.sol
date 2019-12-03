pragma solidity ^0.5.0;

import "./ERC721.sol";
import "./SafeMath.sol";

contract AnimalsTown is ERC721 {
    using SafeMath for uint256;
    address private _moderator;

    struct Animal 
    {
	bool alive;
        address owner;
	bool gender;	
	int age;
        string name;

    }

    Animal[] public Animals;

    event breederAdded(address indexed breeder);
    event animalDeclared(uint objectNumber);

    mapping (address => bool) private _registerBreeder;
    mapping (uint256 => address) private _tokenOwner;

    modifier onlyOwner() {
        require(msg.sender == _moderator, "Owner 0x0");
        _;
    }

    function owner() public view returns (address) {
        return _moderator;
    }

    modifier isRegister(address _address) {
        require(_registerBreeder[_address], "not in registerBreeder");
        _;
    }

    function registerBreeder(address _address) public onlyOwner() {
        require(!_registerBreeder[_address], "aldready in registerBreeder");
        _registerBreeder[_address] = true;
        emit breederAdded(_address);
    }

    function isInRegister(address _address) public view returns (bool) {
        return _registerBreeder[_address];
    }

    function declareAnimal(string memory _name, int _age, bool _gender) public {
        Animal memory _Animal;
        require(isInRegister(msg.sender));

	_Animal.alive = true;
        _Animal.owner = msg.sender;
        _Animal.gender = _gender;        
        _Animal.age = _age;
	_Animal.name = _name;
        

        Animals.push(_Animal) - 1;
        uint objectNumber = Animals.length - 1;
        _tokenOwner[objectNumber] = msg.sender;
        emit animalDeclared(objectNumber);
    }

    function deadAnimal(uint _animalNumber) public {
        require(_tokenOwner[_animalNumber] == msg.sender);
        Animals[_animalNumber].alive = false;
    }


    function breedAnimal(uint _femaleNumber, uint _maleNumber, string memory _name,bool _gender ) public 
    {
        require((Animals[_femaleNumber].gender == true) && (Animals[_maleNumber].gender== false));
        require((_tokenOwner[_femaleNumber] == msg.sender) || (_tokenOwner[_maleNumber] == msg.sender));
        declareAnimal (_name, 0,_gender);
    }


}
