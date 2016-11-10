package com.flyout.domain;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by LiMeiyuan on 2016/11/10 14:58.
 * description:
 */
@Entity
@Table(name = "account_ac")
@DiscriminatorValue(value = "adviser")
public class Adviser extends Account {
}
