package ba.pehli.cinema.test;

import org.openqa.selenium.*;
import org.openqa.selenium.chrome.*;
import org.junit.Test;

public class Tester {
	@Test
	public void testGoogleSearch() throws InterruptedException {
		// Optional. If not specified, WebDriver searches the PATH for chromedriver.
		System.setProperty("webdriver.chrome.driver", "/usr/bin/chromedriver");

		WebDriver driver = new ChromeDriver();
		driver.get("http://localhost:9966/cinema/movies");
		Thread.sleep(5000);  // Let the user actually see something!

		Thread.sleep(5000);  // Let the user actually see something!

		String baseUrl = "http://localhost:9966/cinema/movies";
		String expectedTitle = "Online cinema";
		String actualTitle = "";

		// launch Fire fox and direct it to the Base URL
		driver.get(baseUrl);

		// get the actual value of the title
		actualTitle = driver.getTitle();

		/*
		 * compare the actual title of the page with the expected one and print
		 * the result as "Passed" or "Failed"
		 */
		if (actualTitle.contentEquals(expectedTitle)){
			System.out.println("Test Passed!");
		} else {
		System.out.println("Test Failed");
	 }

		//close Chrome
		driver.close();
		driver.quit();
	}
}

     stage('Run tests') {
      
          dir('Online-cinema/src/test/java/ba/pehli/cinema/test/') {
            sh 'mvn clean test -Dwebdriver.type=chrome -Dwebdriver.chrome.driver=/usr/bin/chromedriver'
          }
      }
