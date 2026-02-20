// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract SkillDatabase {
   
   struct Skills {
    uint256 id;
    string skillname;
    string description;
    uint8 damage;
    string rarity;
    uint8 cost;
   }

   uint256 public nextId = 0;
   mapping(uint256 => Skills) public skills;

   function addSkill(Skills memory NewSkills) public {
     nextId++;
     NewSkills.id = nextId;
     skills[nextId] = NewSkills;
   }

   function getSkill(uint256 id) public view returns (Skills memory) {
    return skills[id];
   }

   function compare(string memory a, string memory b) private pure returns (bool) {
    bytes memory c = bytes(a);
    bytes memory d = bytes(b);
    return c.length == d.length && keccak256(c) == keccak256(d);
   }

   function updateSkill(uint256 id, Skills memory NewSkills) public {
      Skills memory oldSkills = skills[id];

         if(!compare(NewSkills.skillname, "") && !compare(NewSkills.skillname, oldSkills.skillname))
         oldSkills.skillname = NewSkills.skillname;

         if(!compare(NewSkills.description, "") && !compare(NewSkills.description, oldSkills.description))
         oldSkills.description = NewSkills.description;

         if(!compare(NewSkills.rarity, "") && !compare(NewSkills.rarity, oldSkills.rarity))
         oldSkills.rarity = NewSkills.rarity;

         if(NewSkills.damage > 0 && NewSkills.damage != oldSkills.damage)
       oldSkills.damage = NewSkills.damage;

         if(NewSkills.cost > 0 && NewSkills.cost != oldSkills.cost)
       oldSkills.cost = NewSkills.cost;

     skills[id] = oldSkills;
   }

    function removeSkill(uint256 id) public {
        delete skills[id];
    }

}