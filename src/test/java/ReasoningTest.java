import org.junit.Test;
import parser.ClingoRunner;

import java.io.File;

/**
 * Created by CSZ on 15.02.2018.
 */
public class ReasoningTest {

    private final String configPath = System.getProperty("user.dir") + "/logic_programs/Reasoning";

    @Test
    public void ReasoningTest(){
        ClingoRunner runner = new ClingoRunner();
        runner.checkIfSatisfiable(new File(configPath + "/rockPaperScissors.lp"), true);
    }
}
