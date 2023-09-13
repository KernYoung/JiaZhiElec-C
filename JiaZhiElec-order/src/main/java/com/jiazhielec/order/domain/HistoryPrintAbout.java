package com.jiazhielec.order.domain;

import com.jiazhielec.common.core.domain.BaseEntity;

/**
 * 历史打印数据情况
 */
public class HistoryPrintAbout extends BaseEntity {
    /**
     * id
     */
    private Integer id;
    /**
     * 日期编号
     */
    private String key;
    /**
     * 总打印数
     */
    private Integer value;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "HistoryPrintAbout{" +
                "id=" + id +
                ", key='" + key + '\'' +
                ", value=" + value +
                '}';
    }
}
