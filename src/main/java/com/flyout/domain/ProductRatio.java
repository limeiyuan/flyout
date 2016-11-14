package com.flyout.domain;

import javax.persistence.*;

/**
 * Created by LiMeiyuan on 2016/11/14 22:10.
 * description:
 */
@Entity
@Table(name = "product_ratio_pr")
public class ProductRatio {
    @Id
    @GeneratedValue
    @Column(name = "id_pr")
    private Long id;

    @Column(name = "ratio_pr")
    private Integer ratio;

    @Column(name = "category_pr")
    private int type;

    @OneToOne
    @JoinColumn(name = "product_id_pr")
    private Product product;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getRatio() {
        return ratio;
    }

    public void setRatio(Integer ratio) {
        this.ratio = ratio;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
