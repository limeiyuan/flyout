package com.flyout.common.enums;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * Created by LiMeiyuan on 2016/11/14 22:02.
 * description:
 */
@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum CategoryEnum {
    STUDY_ABROAD("留学", "2"),
    EXPAND("拓展", "3"),
    TRAIN("培训", "4"),
    STUDY_TOUR("游学", "5"),
    DOUBLE_DIPLOMA("中外双文凭", "7"),
    BOOK_SERVICE("文书服务", "8"),
    VISA("签证办理", "9"),
    PICKUP("接机送机", "10"),
    PHONE_CARD("电话卡", "11"),
    BANK_CARD("银行卡", "12"),
    SMALL_LANGUAGE("小语种", "13"),
    HOUSE_RENT("房屋租赁", "14"),
    ART_STUDY_ABROAD("艺术留学", "15"),
    ACADEMY_DIRECT("校方直招", "16");

    private String name;
    private String value;

    CategoryEnum(String name, String value) {
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

    public static CategoryEnum recreateEnum(String value) {
        CategoryEnum enumVal = null;

        if (value != null) {
            for (CategoryEnum category : CategoryEnum.values()) {
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
