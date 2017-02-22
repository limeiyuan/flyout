package com.flyout.common.hibernate;

/**
 * Created by LiMeiyuan on 2017/1/13.
 * Description:
 */
public enum MatchType {
    /**
     * equals.
     */
    EQ,
    /**
     * like.
     */
    LIKE,
    /**
     * less than.
     */
    LT,
    /**
     * greater than.
     */
    GT,
    /**
     * less equals.
     */
    LE,
    /**
     * greater equals.
     */
    GE,
    /**
     * in.
     */
    IN,
    /**
     * NOT.
     */
    NOT,
    /**
     * unknown.
     */
    UNKNOWN
}
