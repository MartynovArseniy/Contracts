// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "remix_tests.sol"; // Плагін для тестування в Remix
import "../contracts/DataStorage.sol"; // Імпортуємо наш контракт

contract DataStorageTest {
    DataStorage dataStorage;

    // Виконується перед кожним тестом
    function beforeEach() public {
        dataStorage = new DataStorage(); // Створюємо новий екземпляр контракту
    }

    // Тест на запис даних
    function testWriteData() public {
        dataStorage.writeData("Test Data 1");
        string memory data = dataStorage.getData(0);
        Assert.equal(data, "Test Data 1", "Data does not match the expected value");
    }

    // Тест на оновлення даних
    function testUpdateData() public {
        dataStorage.writeData("Test Data 2");
        dataStorage.updateData(0, "Updated Data");
        string memory updatedData = dataStorage.getData(0);
        Assert.equal(updatedData, "Updated Data", "Data was not updated");
    }

    // Тест на видалення даних
    function testDeleteData() public {
        dataStorage.writeData("Test Data 3");
        dataStorage.deleteData(0);
        
        // Перевіряємо, чи після видалення дані стали порожнім рядком
        string memory deletedData = dataStorage.getData(0);
        Assert.equal(deletedData, "", "Data should be empty after deletion");
    }
    
}
