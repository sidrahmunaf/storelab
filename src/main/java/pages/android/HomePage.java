package pages.android;

import core.utils.AndroidCore.AndroidDriverSetup;
import io.appium.java_client.MobileBy;
import io.appium.java_client.android.AndroidDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import java.util.NoSuchElementException;

public class HomePage {
    private String logo = "logo";
    private String demoStoreOption = "Demo stores";
    private String demoStoreName = "//android.widget.TextView[@text='Another Country']";
    private String searchBar = "android.widget.EditText";
    private String searchButton = "//android.view.View[@content-desc='Search']";


    public WebElement getLogo() {
        return (AndroidDriverSetup.getAndroidDriver().findElementByAccessibilityId(logo));
    }

    public WebElement getSearchBar() {
        return (AndroidDriverSetup.getAndroidDriver().findElementByClassName(searchBar));
    }

    public WebElement getSearchButton() {
        return (AndroidDriverSetup.getAndroidDriver().findElement(By.xpath(searchButton)));
    }

    public WebElement getDemoStoreOption() {
        return (AndroidDriverSetup.getAndroidDriver().findElementByAccessibilityId(demoStoreOption));
    }

    public WebElement getDemoStoreName() {
        return (AndroidDriverSetup.getAndroidDriver().findElement(By.xpath(demoStoreName)));
    }

    public WebElement getOption(String option) {
        return (AndroidDriverSetup.getAndroidDriver().findElementByAccessibilityId(option));
    }

    public WebElement getButtonLocator(String button) {
        return (AndroidDriverSetup.getAndroidDriver().findElement(By.xpath(String.format("//android.widget.TextView[@text='%s']", button))));
    }

    public WebElement getMessageLocator(String error) {
        return (AndroidDriverSetup.getAndroidDriver().findElement(By.xpath(String.format("//android.widget.TextView[@text='%s']", error))));
    }

    public WebElement getSavedAddressLocator(String address) {
        return (AndroidDriverSetup.getAndroidDriver().findElement(By.xpath(String.format("//android.widget.TextView[@text='%s']", address))));
    }

    public WebElement getEditText(String text) {
        AndroidDriver driver = AndroidDriverSetup.getAndroidDriver();
        WebElement editText = null;

        System.out.println("Starting the process to locate and possibly scroll to the element for text: " + text);

        // Scroll to the general area where the EditText might be, using a UI Automator string
        try {
            String uiAutomatorString = String.format(
                    "new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView("
                            + "new UiSelector().textContains(\"%s\"))", text);
            System.out.println("Attempting to scroll to the area of text: " + text);
            driver.findElement(MobileBy.AndroidUIAutomator(uiAutomatorString));
            System.out.println("Scroll completed, now trying to locate the EditText.");
        } catch (Exception e) {
            System.out.println("Failed to scroll to the text: " + text + " due to: " + e.getMessage());
            return null;
        }

        // Now attempt to locate the EditText
        try {
            editText = driver.findElement(MobileBy.xpath(String.format("//android.widget.TextView[@text='%s']//ancestor::android.widget.EditText", text)));
            if (editText != null && editText.isDisplayed()) {
                System.out.println("EditText found and is visible after scrolling.");
                return editText;
            } else {
                System.out.println("EditText not visible even after scrolling.");
                throw new Exception("Failed to find or the EditText is not visible after scrolling.");
            }
        } catch (NoSuchElementException e) {
            System.out.println("Could not find the EditText associated with the text: " + text);
            throw new NoSuchElementException("No such element: Unable to locate the EditText with the text: " + text);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public WebElement getProductLocator(String product) {
        return (AndroidDriverSetup.getAndroidDriver().findElement(By.xpath(String.format("//android.widget.TextView[@text='%s']", product))));
    }

    public WebElement getDropdownOption(String option) {
        return (AndroidDriverSetup.getAndroidDriver().findElement(By.xpath(String.format("//android.widget.TextView[@text='%s']", option))));
    }

    public void scrollToButton(String button) {
        try {
            // Updated UiAutomator string to use 'text' instead of 'description'
            String uiAutomatorString = String.format(
                    "new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().text(\"%s\"))", button);
            WebElement buttonElement = AndroidDriverSetup.getAndroidDriver().findElement(MobileBy.AndroidUIAutomator(uiAutomatorString));

            // Verify element is displayed after scrolling
            if (!buttonElement.isDisplayed()) {
                throw new Exception("Button not visible after scrolling: " + button);
            }
        } catch (Exception e) {
            // Log the error or handle it according to your test framework
            System.out.println("Error while scrolling to button: " + e.getMessage());
        }
    }
}
