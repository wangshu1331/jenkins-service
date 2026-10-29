import com.lesfurets.jenkins.unit.BasePipelineTest
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.assertEquals

class ParamTest extends BasePipelineTest {

    def param

    @Before //每次执行测试方法前都会执行这个方法
    void setUp() {
        super.setUp()
        param = loadScript('vars/param.groovy')
    }

    @Test
    void testParse() {
        def output = 'a\trefs/tags/v1.0.0\nb\trefs/tags/v2.0.0\n'
        println("output:${output}")
        println("testParse is over")
        assertEquals(['v1.0.0', 'v2.0.0'], param.parse(output))
    }

    @Test
    void testEmpty() {
        assertEquals([], param.parse(''))
    }
}
// 