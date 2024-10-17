// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserRegistration {
    struct User {
        string email;
        bytes32 passwordHash;  // Храним хеш пароля для безопасности
        bool isRegistered;
        bool isActive;
    }

    mapping(string => User) private usersByEmail;

    // Регистрация пользователя с email и паролем
    function register(string memory _email, string memory _password) public {
        require(!usersByEmail[_email].isRegistered, "User with this email is already registered");

        usersByEmail[_email].email = _email;
        usersByEmail[_email].passwordHash = keccak256(abi.encodePacked(_password)); // Хеширование пароля
        usersByEmail[_email].isRegistered = true;
        usersByEmail[_email].isActive = true;
    }

    // Деактивация пользователя
    function deactivate(string memory _email) public {
        require(usersByEmail[_email].isRegistered, "User is not registered");
        require(usersByEmail[_email].isActive, "User is already deactivated");

        usersByEmail[_email].isActive = false;
    }

    // Проверка регистрации
    function isRegistered(string memory _email) public view returns (bool) {
        return usersByEmail[_email].isRegistered;
    }

    // Проверка активности пользователя
    function isActive(string memory _email) public view returns (bool) {
        return usersByEmail[_email].isActive;
    }

    // Аутентификация пользователя по email и паролю
    function authenticate(string memory _email, string memory _password) public view returns (bool) {
        require(usersByEmail[_email].isRegistered, "User is not registered");
        return keccak256(abi.encodePacked(_password)) == usersByEmail[_email].passwordHash;
    }
}
