# Flutter Test Automation Project

This project is a Flutter application designed to demonstrate Flutter app testing using GitHub Actions and Allure Report.

The app includes various screens (Login, Home, Products, Checkout, Counter) to simulate real-world scenarios for automated testing.

---

## Getting Started

### Prerequisites
* [Flutter SDK](https://docs.flutter.dev/get-started/quick) installed.

### Installation
1.  Clone the repository
2.  Navigate to the project directory:
    ```bash
    cd fluttertest
    ```
3.  Install dependencies:
    ```bash
    flutter pub get
    ```

---

## Running the App

To run the application on an emulator or connected device:

```bash
flutter run
```

## Running Tests

### Run all tests
To execute all test cases in the console:

```bash
flutter test
```

Run a specific test file

```bash
flutter test test/TEST_NAME
```

## Reporting
You can view the latest test report at:
https://oksan-l.github.io/fluttertest/

## Test Cases Covered

The project covers 15 test scenarios, ranging from simple UI checks to complex state persistence logic.

| ID | Test Name | Description |
| :--- | :--- | :--- |
| **01** | `textTest` | Verifies the presence of "Hello World" text on the screen. |
| **02** | `iconTest` | Checks if a specific Icon is present and verifies its color and type. |
| **03** | `scrollTest` | Simulates scrolling through a list to find an item that is initially off-screen. |
| **04** | `dragAndDropTest` | Tests the functionality of reordering items in a list via drag-and-drop. |
| **05** | `animationTest` | Verifies functionality that involves time delays (Counter with delay). |
| **06** | `loginSuccess` | **Happy Path:** Enters valid credentials and verifies navigation to the Home Page. |
| **07** | `loginInvalidPassword` | **Negative:** Enters a wrong password and checks for the error message. |
| **08** | `logout` | Verifies that clicking Logout returns the user to the Login Page. |
| **09** | `validationEmptyFields` | Ensures the Login button is disabled or shows an error when fields are empty. |
| **10** | `checkoutFlow` | **Fail/Safe Scenario:** Simulates a full purchase flow. Designed to handle missing buttons gracefully (checking `expect` logic). |
| **11** | `dismissItem` | Tests the "Swipe to Delete" (Dismissible) functionality in a list. |
| **12** | `dialogInteraction` | Verifies opening a Modal Dialog and interacting with its buttons (e.g., Confirm/Cancel). |
| **13** | `navigationPop` | Verifies the functionality of the "Back" button (System Back or UI Back) from Cart to Products. |
| **14** | `counterIncrementRandom` | Generates a **random number** (2-6), taps the button that many times, and verifies the counter value. |
| **15** | `productStatePersistence` | Adds a **random number** of items to the cart, navigates away, returns, and verifies the cart count is preserved. |