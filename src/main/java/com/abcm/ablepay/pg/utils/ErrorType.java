package com.abcm.ablepay.pg.utils;


public enum ErrorType {
    DATA_NOT_FOUND("404", "Requested data not found"),
    INVALID_INPUT("400", "Invalid input provided"),
    UNKNOWN_ERROR("420", "An unexpected error occurred");

    private final String code;
    private final String message;

    ErrorType(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}