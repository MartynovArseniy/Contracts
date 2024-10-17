// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "remix_tests.sol"; // Подключаем библиотеку для тестирования
import "../contracts/ReRegistration.sol"; // Подключаем наш контракт

contract UserRegistrationTest {
    UserRegistration userRegistration;

    // Функция, которая вызывается перед каждым тестом
    function beforeEach() public {
        userRegistration = new UserRegistration(); // Разворачиваем новый экземпляр контракта
    }

    // Тестируем регистрацию нового пользователя
    function testRegisterNewUser() public {
        string memory email = "test@example.com";
        string memory password = "password123";

        userRegistration.register(email, password); // Регистрируем пользователя

        // Проверяем, что пользователь зарегистрирован
        bool isRegistered = userRegistration.isRegistered(email);
        Assert.equal(isRegistered, true, "User should be registered");
    }

    // Тестируем попытку регистрации с тем же email
    function testDuplicateRegistration() public {
        string memory email = "test@example.com";
        string memory password = "password123";

        userRegistration.register(email, password); // Регистрируем пользователя

        // Попытка повторной регистрации с тем же email должна завершиться ошибкой
        bool r;
        (r, ) = address(userRegistration).call(abi.encodeWithSignature("register(string,string)", email, password));
        Assert.equal(r, false, "Should fail when trying to register with the same email");
    }

    // Тестируем деактивацию пользователя
    function testDeactivateUser() public {
        string memory email = "test@example.com";
        string memory password = "password123";

        userRegistration.register(email, password); // Регистрируем пользователя

        // Проверяем, что пользователь зарегистрирован перед деактивацией
        bool isRegistered = userRegistration.isRegistered(email);
        Assert.equal(isRegistered, true, "User should be registered before deactivation");

        userRegistration.deactivate(email); // Деактивируем пользователя

        // Проверяем, что пользователь деактивирован
        bool isActive = userRegistration.isActive(email);
        Assert.equal(isActive, false, "User should be deactivated");
    }

    // Тестируем аутентификацию
    function testAuthenticateUser() public {
        string memory email = "test@example.com";
        string memory password = "password123";

        userRegistration.register(email, password); // Регистрируем пользователя

        // Проверяем успешную аутентификацию
        bool authenticated = userRegistration.authenticate(email, password);
        Assert.equal(authenticated, true, "User should be authenticated");

        // Проверяем неуспешную аутентификацию
        bool failedAuth = userRegistration.authenticate(email, "wrongpassword");
        Assert.equal(failedAuth, false, "Authentication should fail with wrong password");
    }

    // Проверяем, что нельзя деактивировать незарегистрированного пользователя
    function testDeactivateUnregisteredUser() public {
        string memory email = "notregistered@example.com";

        bool r;
        (r, ) = address(userRegistration).call(abi.encodeWithSignature("deactivate(string)", email));
        Assert.equal(r, false, "Should fail when trying to deactivate an unregistered user");
    }

    
    function assertIsRegistered(string memory email, bool expected) internal {
        bool isRegistered = userRegistration.isRegistered(email);
        Assert.equal(isRegistered, expected, "User registration status should match expected value");
    }
}