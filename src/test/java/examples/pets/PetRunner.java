package examples.pets;

import com.intuit.karate.junit5.Karate;

public class PetRunner {

    @Karate.Test
    Karate testAddDogs() {
        return Karate.run("pets").relativeTo(getClass());
    }

}
