package com.course.server.enums;

public enum PlantStatusEnum {

    YES("1", "已被领养"),
    NO("0", "未被领养");

    private String code;

    private String desc;

    PlantStatusEnum(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }
}
