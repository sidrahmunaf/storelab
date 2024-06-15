package step_defination.Android;


import core.utils.AndroidCore.AndroidDriverSetup;
import com.github.javafaker.Faker;


import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.openqa.selenium.*;
import org.testng.Assert;
import pages.Page;


public class HomeSteps extends Page {
    @When("App should open successfully")
    public void appShouldOpenSuccessfully() {
        Assert.assertTrue(getHomePage().getLogo().isDisplayed());
    }

    @When("I click demo store option")
    public void iClickDemoStoreOption() {
        getHomePage().getDemoStoreOption().click();
    }

    @When("I click on available demo store")
    public void iClickOnAvailableDemoStore() {
        getHomePage().getDemoStoreName().click();
    }

    @When("^I click on (.*) option$")
    public void iClickOnAccountOption(String name) {
        getHomePage().getOption(name).click();
    }

    @When("^I click on (.*) button$")
    public void iClickOnXxxButton(String name) {
        getHomePage().getButtonLocator(name).click();
    }

    @When("I click on search button on search field")
    public void iClickOnSearchButton() {
        getHomePage().getSearchButton().click();
    }

    @When("^I type (.*) in field for (.*)$")
    public void itypeXxxInXxxIndexField(String text, String field) {
        Faker faker = new Faker();
        if ("Email".equalsIgnoreCase(field) && "random".equalsIgnoreCase(text)) {
            text = faker.internet().emailAddress(); // Generates a random email
        }
        getHomePage().getEditText(field).sendKeys(text);
    }

    @Then("^I should see (.*) error message$")
    public void iShouldSeeXxxErrorMessage(String message) {
        Assert.assertTrue(getHomePage().getMessageLocator(message).isDisplayed());
    }

    @Then("^I should see (.*) success message$")
    public void iShouldSeeXxxSuccessMessage(String message) {
        Assert.assertTrue(getHomePage().getMessageLocator(message).isDisplayed());
    }

    @When("^I type (.*) in search bar$")
    public void iTypeXxxInSearchBar(String text) {
        getHomePage().getSearchBar().sendKeys(text);
    }

    @And("^I wait (\\d+) seconds$")
    public void iWaitSeconds(int seconds) {
        try {
            // Convert seconds to milliseconds and wait
            Thread.sleep(seconds * 1000L);
            System.out.println("Waited " + seconds + " seconds.");
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            System.err.println("Wait was interrupted.");
        }
    }

    @When("^I click on (.*) product")
    public void iClickOnXxxProduct(String product) {
        getHomePage().getProductLocator(product).click();
    }

    @When("^I click on (.*) option in (.*) dropdown")
    public void iClickOnXxxOptionInDropdown(String option, String field) {
        AndroidDriverSetup.getAndroidDriver().findElement(By.xpath(String.format("//android.widget.TextView[@text='%s']//ancestor::android.widget.EditText", field))).click();
        getHomePage().getDropdownOption(option).click();

    }

    @Then("^I should see the following saved address on checkout page$")
    public void iShouldSeeTheFollowingSavedAddressOnCheckoutPage(String address) {
        Assert.assertTrue(getHomePage().getSavedAddressLocator(address).isDisplayed());
    }

    @When("^I close the keyboard$")
    public void iCloseTheKeyboard() {
        AndroidDriverSetup.getAndroidDriver().hideKeyboard();
    }

    @When("^I scroll towards (.*) button$")
    public void iScrollTowardsXxxButton(String button) {
        getHomePage().scrollToButton(button);

    }
}


