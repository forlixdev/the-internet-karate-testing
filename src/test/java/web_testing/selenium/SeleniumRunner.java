package web_testing.selenium;

import com.intuit.karate.junit5.Karate;

class SeleniumRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run().relativeTo(getClass());
    }

}
