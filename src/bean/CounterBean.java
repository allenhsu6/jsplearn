package bean;

import java.io.Serializable;

public class CounterBean implements Serializable {
    int count;

    public CounterBean() {
    }

    public int getCount(){
        count++;
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
