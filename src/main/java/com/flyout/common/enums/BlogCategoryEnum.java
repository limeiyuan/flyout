package com.flyout.common.enums;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * Created by LiMeiyuan on 2016/12/21.
 * Description:
 */
@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum BlogCategoryEnum {
    QA("留学咨询", "0"),
    RECOMMEND("干货", "1"),
    AUSTRALIA("澳大利亚", "2"),
    NZ("新西兰", "3");

    private String name;
    private String value;

    BlogCategoryEnum(String name, String value) {
        this.name = name;
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public static BlogCategoryEnum recreateEnum(String value) {
        BlogCategoryEnum enumVal = null;

        if (value != null) {
            for (BlogCategoryEnum category : BlogCategoryEnum.values()) {
                if (category.getValue().equalsIgnoreCase(value)) {
                    enumVal = category;
                    break;
                }
            }
        }
        return enumVal;
    }

    public String recreateString() {
        return value;
    }
}
