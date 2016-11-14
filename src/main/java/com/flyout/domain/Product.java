package com.flyout.domain;

import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

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

    @Column(name = "name_pi")
    private String title;

    @ManyToOne
    @JoinColumn(name = "photo_id_pi")
    private Photo photo;

    /**
     * 类型
     **/
    @Type(type = "cn.flyout.common.util.EnumUserType", parameters = {
            @org.hibernate.annotations.Parameter(name = "enumClassName", value = "com.flyout.common.enums.CategoryEnum"),
            @org.hibernate.annotations.Parameter(name = "recreateEnumMthd", value = "recreateEnum"),
            @org.hibernate.annotations.Parameter(name = "recreateStringMthd", value = "recreateString")
    })

    @ManyToOne
    @JoinColumn(name = "nation_id_pi")
    private NationInfo nation;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "city_id_pi")
    private CityInfo city;

    @ManyToOne
    @JoinColumn(name = "dictionary_id_pi")
    private DictionaryInfo language;

    @ManyToOne
    @JoinColumn(name = "vender_id_pi")
    private Vender vender;

    @ManyToOne
    @JoinColumn(name = "adviser_id_pi")
    private Account adviser;

    @Column(name = "price_pi")
    private String price;

    @Column(name = "discount_pi")
    private String discount;

    @Column(name = "highlight_pi")
    private String highlight;

    @Column(name = "intro_pi")
    private String intro;

    @ManyToOne
    @JoinColumn(name = "intro_photo_id_pi")
    private Photo introPhoto;

    @Column(name = "target_users_pi")
    private String targetUsers;

    @Column(name = "detail_pi")
    private String detail;

    @Column(name = "price_detail_pi")
    private String priceDetail;

    @Column(name = "time_place_pi")
    private String timePlace;

    @Column(name = "score_pi")
    private int score;

    @Column(name = "inventory_pi")
    private int inventory;

    @Column(name = "order_num_pi")
    private int orderNum;

    @Column(name = "favorite_num_pi")
    private int favoriteNum;

    @Column(name = "click_num_pi")
    private int clickNum;

    @Column(name = "sharing_num_pi")
    private int sharingNum;

    @Column(name = "up_flag_pi")
    private int upFlag;

    @Column(name = "up_order_by_pi")
    private int upOrder;

    @Column(name = "up_path_pi")
    private String upPhoto;

    @Column(name = "top_flag_pi")
    private int topFlag;

    @Column(name = "top_order_by_pi")
    private int topOrder;

    @Column(name = "exp_date_pi")
    private Date expDate;

    @Column(name = "createtime_pi")
    private Date createTime;

    @Column(name = "enable_pi")
    private Integer enable;//有效

    @OneToOne(mappedBy = "product")
    private ProductRatio productRatio;

    @OneToMany
    @JoinTable(name = "product_house_photo_php", joinColumns = {@JoinColumn(name = "product_id_php")},
            inverseJoinColumns = {@JoinColumn(name = "photo_id_php")})
    private List<Photo> housePhotos;


    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Photo getPhoto() {
        return photo;
    }

    public void setPhoto(Photo photo) {
        this.photo = photo;
    }

    public NationInfo getNation() {
        return nation;
    }

    public void setNation(NationInfo nation) {
        this.nation = nation;
    }

    public CityInfo getCity() {
        return city;
    }

    public void setCity(CityInfo city) {
        this.city = city;
    }

    public DictionaryInfo getLanguage() {
        return language;
    }

    public void setLanguage(DictionaryInfo language) {
        this.language = language;
    }

    public Vender getVender() {
        return vender;
    }

    public void setVender(Vender vender) {
        this.vender = vender;
    }

    public Account getAdviser() {
        return adviser;
    }

    public void setAdviser(Account adviser) {
        this.adviser = adviser;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }

    public String getHighlight() {
        return highlight;
    }

    public void setHighlight(String highlight) {
        this.highlight = highlight;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public Photo getIntroPhoto() {
        return introPhoto;
    }

    public void setIntroPhoto(Photo introPhoto) {
        this.introPhoto = introPhoto;
    }

    public String getTargetUsers() {
        return targetUsers;
    }

    public void setTargetUsers(String targetUsers) {
        this.targetUsers = targetUsers;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getPriceDetail() {
        return priceDetail;
    }

    public void setPriceDetail(String priceDetail) {
        this.priceDetail = priceDetail;
    }

    public String getTimePlace() {
        return timePlace;
    }

    public void setTimePlace(String timePlace) {
        this.timePlace = timePlace;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public int getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(int orderNum) {
        this.orderNum = orderNum;
    }

    public int getFavoriteNum() {
        return favoriteNum;
    }

    public void setFavoriteNum(int favoriteNum) {
        this.favoriteNum = favoriteNum;
    }

    public int getClickNum() {
        return clickNum;
    }

    public void setClickNum(int clickNum) {
        this.clickNum = clickNum;
    }

    public int getSharingNum() {
        return sharingNum;
    }

    public void setSharingNum(int sharingNum) {
        this.sharingNum = sharingNum;
    }

    public int getUpFlag() {
        return upFlag;
    }

    public void setUpFlag(int upFlag) {
        this.upFlag = upFlag;
    }

    public int getUpOrder() {
        return upOrder;
    }

    public void setUpOrder(int upOrder) {
        this.upOrder = upOrder;
    }

    public String getUpPhoto() {
        return upPhoto;
    }

    public void setUpPhoto(String upPhoto) {
        this.upPhoto = upPhoto;
    }

    public int getTopFlag() {
        return topFlag;
    }

    public void setTopFlag(int topFlag) {
        this.topFlag = topFlag;
    }

    public int getTopOrder() {
        return topOrder;
    }

    public void setTopOrder(int topOrder) {
        this.topOrder = topOrder;
    }

    public Date getExpDate() {
        return expDate;
    }

    public void setExpDate(Date expDate) {
        this.expDate = expDate;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getEnable() {
        return enable;
    }

    public void setEnable(Integer enable) {
        this.enable = enable;
    }

    public ProductRatio getProductRatio() {
        return productRatio;
    }

    public void setProductRatio(ProductRatio productRatio) {
        this.productRatio = productRatio;
    }

    public List<Photo> getHousePhotos() {
        return housePhotos;
    }

    public void setHousePhotos(List<Photo> housePhotos) {
        this.housePhotos = housePhotos;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
