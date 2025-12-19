package gymexercises.api;

import io.quarkus.test.junit.QuarkusTest;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;

@QuarkusTest
class ExerciseResourceTest {
    @Test
    void testAllEndpoint() {
        given()
          .when().get("/exercises/all")
          .then()
             .statusCode(200);
    }

}