const webdriver = require("selenium-webdriver");
const chrome = require("selenium-webdriver/chrome");
const { By } = require("selenium-webdriver");

const test = async () => {
  const driver = new webdriver.Builder()
    .forBrowser("chrome")
    .setChromeOptions(new chrome.Options().headless())
    .build();

  try {
    //Local host
    await driver.get("http://localhost:8000");

    // Simulate an authenticated user with user_role = '1' (admin)
    const adminUserButton = await driver.findElement(By.id("admin-user-button"));
    await adminUserButton.click();

    // Wait for the redirect to happen
    await driver.wait(webdriver.until.urlIs("http://localhost:8000/admin/home"), 5000);

    // Assert that the redirect to the admin home page is successful
    const adminHomePageTitle = await driver.getTitle();
    console.log(adminHomePageTitle === "Admin Home Page" ? "PASS" : "FAIL");

    // Assert that the status message on the admin home page is displayed correctly
    const adminStatusMessage = await driver.findElement(By.className("status-message")).getText();
    console.log(adminStatusMessage === "Welcome Admin" ? "PASS" : "FAIL");

    // Simulate an authenticated user with user_role != '1' (regular user)
    const regularUserButton = await driver.findElement(By.id("regular-user-button"));
    await regularUserButton.click();

    // Wait for the redirect to happen
    await driver.wait(webdriver.until.urlIs("http://localhost:8000/home"), 5000);

    // Assert that the redirect to the regular user home page is successful
    const regularUserHomePageTitle = await driver.getTitle();
    console.log(regularUserHomePageTitle === "User Home Page" ? "PASS" : "FAIL");

    // Assert that the status message on the regular user home page is displayed correctly
    const regularUserStatusMessage = await driver.findElement(By.className("status-message")).getText();
    console.log(regularUserStatusMessage === "Welcome User" ? "PASS" : "FAIL");

    console.log("test case 1: successfully completed");

    // Start the new test case for user registration
    await driver.get("http://localhost:8000/register");

    // Fill in the registration form with valid data
    await driver.findElement(By.id("name")).sendKeys("Khadija Iqbal");
    await driver.findElement(By.id("email")).sendKeys("khadijaiqbal@example.com");
    await driver.findElement(By.id("password")).sendKeys("password");
    await driver.findElement(By.id("password_confirmation")).sendKeys("password");
    await driver.findElement(By.id("register-button")).click();

    // Wait for the validation to complete and check for success
    const successMessage = await driver.findElement(By.className("success-message")).getText();
    console.log(successMessage === "Registration successful" ? "PASS" : "FAIL");

    // Clear the registration form
    await driver.findElement(By.id("name")).clear();
    await driver.findElement(By.id("email")).clear();
    await driver.findElement(By.id("password")).clear();
    await driver.findElement(By.id("password_confirmation")).clear();

    // Fill in the registration form with invalid data (missing name)
    await driver.findElement(By.id("email")).sendKeys("khadijaiqbal@example.com");
    await driver.findElement(By.id("password")).sendKeys("password");
    await driver.findElement(By.id("password_confirmation")).sendKeys("password");
    await driver.findElement(By.id("register-button")).click();

    // Wait for the validation to complete and check for errors
    const nameErrorMessage = await driver.findElement(By.id("name-error")).getText();
    console.log(nameErrorMessage === "The name field is required." ? "PASS" : "FAIL");

    // Clear the registration form
    await driver.findElement(By.id("email")).clear();
    await driver.findElement(By.id("password")).clear();
    await driver.findElement(By.id("password_confirmation")).clear();

    // Fill in the registration form with invalid data (invalid email)
    await driver.findElement(By.id("name")).sendKeys("Khadija Iqbal");
    await driver.findElement(By.id("email")).sendKeys("invalidemail");
    await driver.findElement(By.id("password")).sendKeys("password");
    await driver.findElement(By.id("password_confirmation")).sendKeys("password");
    await driver.findElement(By.id("register-button")).click();

    // Wait for the validation to complete and check for errors
    const emailErrorMessage = await driver.findElement(By.id("email-error")).getText();
    console.log(emailErrorMessage === "The email must be a valid email address." ? "PASS" : "FAIL");

    // Clear the registration form
    await driver.findElement(By.id("name")).clear();
    await driver.findElement(By.id("email")).clear();
    await driver.findElement(By.id("password")).clear();
    await driver.findElement(By.id("password_confirmation")).clear();

    // Fill in the registration form with invalid data (password mismatch)
    await driver.findElement(By.id("name")).sendKeys("Khadija Iqbal");
    await driver.findElement(By.id("email")).sendKeys("khadijaiqbal@example.com");
    await driver.findElement(By.id("password")).sendKeys("password");
    await driver.findElement(By.id("password_confirmation")).sendKeys("differentpassword");
    await driver.findElement(By.id("register-button")).click();

    // Wait for the validation to complete and check for errors
    const confirmationErrorMessage = await driver.findElement(By.id("password-confirmation-error")).getText();
    console.log(confirmationErrorMessage === "The password confirmation does not match." ? "PASS" : "FAIL");

    console.log("test case 2: successfully completed");



    await driver.get("http://localhost:8000/add-movie");

    // Fill in the movie details
    await driver.findElement(By.id("movie_name")).sendKeys("Test Movie");
    await driver.findElement(By.id("movie_description")).sendKeys("This is a test movie");
    await driver.findElement(By.id("ratings")).sendKeys("4.5");
    await driver.findElement(By.id("year")).sendKeys("2023");

    // Upload a movie cover image
    const coverInput = await driver.findElement(By.id("movie_cover"));
    await coverInput.sendKeys("path/to/movie_cover.jpg");

    // Submit the form
    await driver.findElement(By.id("submit-button")).click();

    // Wait for the movie to be added (you can add custom wait logic here)
    await driver.sleep(2000);

    // Check if the movie was added successfully
    const successMessage2 = await driver.findElement(By.className("success-message")).getText();
    console.log(successMessage2 === "Movie added successfully" ? "PASS" : "FAIL");

    // Add console.log line
    console.log("Test case 3: Movie addition completed");


    await driver.get("http://localhost:8000/edit-movie/{movie_id}");

    // Fill in the updated movie details
    await driver.findElement(By.id("movie_name")).clear();
    await driver.findElement(By.id("movie_name")).sendKeys("Updated Movie");
    await driver.findElement(By.id("movie_description")).clear();
    await driver.findElement(By.id("movie_description")).sendKeys("This is an updated movie");
    await driver.findElement(By.id("ratings")).clear();
    await driver.findElement(By.id("ratings")).sendKeys("4.8");
    await driver.findElement(By.id("year")).clear();
    await driver.findElement(By.id("year")).sendKeys("2024");

    // Upload a new movie cover image
    const coverInput2 = await driver.findElement(By.id("movie_cover"));
    await coverInput2.sendKeys("path/to/new_movie_cover.jpg");

    // Submit the form
    await driver.findElement(By.id("submit-button")).click();

    // Wait for the movie to be updated (you can add custom wait logic here)
    await driver.sleep(2000);

    // Check if the movie was updated successfully
    const successMessage3 = await driver.findElement(By.className("success-message")).getText();
    console.log(successMessage3 === "Movie updated successfully" ? "PASS" : "FAIL");

    // Add console.log line
    console.log("Test case 4: Movie update completed");



    await driver.get("http://localhost:8000/add-review/{movie_id}/{user_id}");

    // Fill in the review details
    await driver.findElement(By.id("movie_review")).sendKeys("This is a great movie!");

    // Submit the form
    await driver.findElement(By.id("submit-button")).click();

    // Wait for the review to be added (you can add custom wait logic here)
    await driver.sleep(2000);

    // Check if the review was added successfully
    const successMessage4 = await driver.findElement(By.className("success-message")).getText();
    console.log(successMessage4 === "Review added successfully" ? "PASS" : "FAIL");

    // Add console.log line
    console.log("Test case5: Movie review added");




    await driver.get("http://localhost:8000/admin/add-review/{movie_id}/{user_id}");

    // Fill in the review details
    await driver.findElement(By.id("movie_review")).sendKeys("This is a great movie!");

    // Submit the form
    await driver.findElement(By.id("submit-button")).click();

    // Wait for the review to be added (you can add custom wait logic here)
    await driver.sleep(2000);

    // Check if the review was added successfully
    const successMessage5 = await driver.findElement(By.className("success-message")).getText();
    console.log(successMessage5 === "Review added successfully" ? "PASS" : "FAIL");

    // Add console.log line
    console.log("Test case 6: Admin movie review added");




    await driver.get("http://localhost:8000/add-ticket/{user_id}/{movie_id}/{show_id}");

    // Fill in the ticket details
    await driver.findElement(By.id("no_of_seats")).sendKeys("2");
    await driver.findElement(By.id("totalbill")).sendKeys("20");

    // Submit the form
    await driver.findElement(By.id("submit-button")).click();

    // Wait for the ticket to be added (you can add custom wait logic here)
    await driver.sleep(2000);

    // Check if the ticket was added successfully
    const successMessage7 = await driver.findElement(By.className("success-message")).getText();
    console.log(successMessage7 === "Ticket added successfully" ? "PASS" : "FAIL");

    // Add console.log line
    console.log("Test case 7: Ticket added");


    await driver.get("http://localhost:8000/usershow");

    // Wait for the movies to be loaded (you can add custom wait logic here)
    await driver.sleep(2000);

    // Get the list of movies
    const movieElements = await driver.findElements(By.className("movie-item"));
    const movieTitles = await Promise.all(movieElements.map((element) => element.getText()));

    // Verify if the movie list is displayed correctly
    console.log(movieTitles.length > 0 ? "PASS" : "FAIL");

    // Add console.log line
    console.log("Test case 8 : Movie list displayed");



    const showId = "123"; // Replace with the actual ID of the show to be deleted
    const deleteButton = await driver.findElement(By.id(`delete-show-${showId}`));

    // Perform a click action on the delete button
    await deleteButton.click();

    // Wait for the redirect to happen
    await driver.wait(webdriver.until.urlIs("http://localhost:8000/admin/viewShows"), 5000);

    // Assert that the deletion message is displayed correctly
    const deletionStatusMessage = await driver.findElement(By.className("status-message")).getText();
    console.log(deletionStatusMessage === "Show Deleted Successfully" ? "PASS" : "FAIL");

    // Add console.log line
    console.log("Test case 9: Show deleted successfully");








  } catch (error) {
    console.log("Error: " + error);
  } finally {
    // Close the browser
    await driver.quit();
  }
};

// Run the test case
test();
