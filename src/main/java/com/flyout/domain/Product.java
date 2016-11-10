package com.flyout.domain;

import javax.persistence.*;

/**
 * Created by LiMeiyuan on 2016/11/9 22:24.
 * description:
 */
@Entity
@Table(name = "product_info_pi")
public class Product {
    @Id
    @GeneratedValue
    @Column(name = "id_pi")
    private Long id;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
