package ru.airconcept.model;

import java.math.BigDecimal;
import java.util.Date;

public class ModelOrder {
    private int id;
    private int customerId;
    private String nametemplate;
    private String namematerial;
    private int typematerial;
    private int number;
    private int size;
    private int width;
    private int height;
    private BigDecimal totalNDC;
    private String img;
    private Date createdAt;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getNametemplate() {
        return nametemplate;
    }

    public void setNametemplate(String nametemplate) {
        this.nametemplate = nametemplate;
    }

    public String getNamematerial() {
        return namematerial;
    }

    public void setNamematerial(String namematerial) {
        this.namematerial = namematerial;
    }

    public int getTypematerial() {
        return typematerial;
    }

    public void setTypematerial(int typematerial) {
        this.typematerial = typematerial;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public BigDecimal getTotalNDC() {
        return totalNDC;
    }

    public void setTotalNDC(BigDecimal totalNDC) {
        this.totalNDC = totalNDC;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}
