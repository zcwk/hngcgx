import com.zdzyc.ssm.qcloud.QCloud;
import org.junit.jupiter.api.Test;

/**
 * Created by zhoudezheng on 2017/3/14.
 */
public class QCloudTest {


    @Test
    public void test(){
        QCloud.getIstance().uploadFile("11","","");
    }


}
