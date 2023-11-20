package examples.reqres;

import com.intuit.karate.junit5.Karate;

class Runner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("f3_list_resource").tags().relativeTo(getClass());
    }    

}
