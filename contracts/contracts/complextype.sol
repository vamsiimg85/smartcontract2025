// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <0.9.0;

/// @title A contract to demonstrate Reference Types in Solidity
/// @author Jitendra Kumar
/// @notice This contract shows how reference types work in Solidity

contract MappingExample {

    // ✅ Fixed-size array of uint
    uint[5] public array = [uint(1), 2, 3, 4, 5];

    // ✅ Defining a struct
    struct Student {
        string name;
        string subject;
        uint8 marks;
    }

    // ✅ Struct instance
    Student public std1;

    // ✅ Function to assign values and return struct fields
    function structure() public returns (
        string memory, string memory, uint8
    ) {
        std1.name = "John";
        std1.subject = "Chemistry";
        std1.marks = 88;
        return (std1.name, std1.subject, std1.marks);
    }

    // ✅ Mapping and address array for dynamic student data
    mapping(address => Student) public result;
    address[] public student_result;

    // Add a student to the mapping and address array
    function addStudent(
        address _addr,
        string memory _name,
        string memory _subject,
        uint8 _marks
    ) public {
        result[_addr] = Student(_name, _subject, _marks);
        student_result.push(_addr);
    }

    // View a student record by address
    function getStudent(address _addr) public view returns (
        string memory, string memory, uint8
    ) {
        Student memory s = result[_addr];
        return (s.name, s.subject, s.marks);
    }

    // Get number of students added
    function getStudentCount() public view returns (uint) {
        return student_result.length;
    }
}
