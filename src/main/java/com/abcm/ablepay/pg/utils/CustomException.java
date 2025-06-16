package com.abcm.ablepay.pg.utils;


public class CustomException extends RuntimeException {
    private final String errorCode;
    private final String message;

    public CustomException(ErrorType errorType) {
        super(errorType.getMessage());
        this.errorCode = errorType.getCode();
        this.message = errorType.getMessage();
    }

    public String getErrorCode() {
        return errorCode;
    }

    @Override
    public String getMessage() {
        return message;
    }
}