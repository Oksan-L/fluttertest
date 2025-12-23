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
| **001** | `enterText` | Verifies that text can be entered into a TextField and is displayed correctly. |
| **002** | `tap` | Checks that the Submit button responds to a tap event (verifies state change/text update). |
| **003** | `waitFor` | Verifies that a widget appears in the widget tree after a 2-second delay. |
| **004** | `waitForAbsent` | Ensures "Temporary message" text is initially present and then checks it is removed after an action. |
| **005** | `scrollUntilVisible` | Simulates scrolling through a long list to find a specific item that is initially off-screen. |
| **006** | `loginSuccess` | **Positive:** Enters valid credentials and verifies navigation to the Home Page. |
| **007** | `loginInvalidPassword` | **Negative:** Enters a wrong password and checks for the error message. |
| **008** | `logout` | Verifies that clicking Logout returns the user to the Login Page. |
| **009** | `validationEmptyFields` | Ensures the Login button is disabled or shows an error when fields are empty. |
| **010** | `checkoutFlow` | Simulates a full purchase flow. |
| **011** | `dismissItem` | Tests the "Swipe to Delete" (Dismissible) functionality in a list. |
| **012** | `dialogInteraction` | Verifies opening a Modal Dialog and interacting with its buttons (e.g., Confirm/Cancel). |
| **013** | `navigationPop` | Verifies the functionality of the "Back" button (System Back or UI Back) from Cart to Products. |
| **014** | `counterIncrementRandom` | Generates a random number (2-6), taps the button that many times, and verifies the counter value. |
| **015** | `productStatePersistence` | Adds a random number of items to the cart, navigates away, returns, and verifies the cart count is preserved. |