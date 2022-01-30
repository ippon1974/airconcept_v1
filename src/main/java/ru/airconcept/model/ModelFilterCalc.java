package ru.airconcept.model;

import java.math.BigDecimal;

public class ModelFilterCalc {
    private int gid;
    private int gtype; // 0-Прямоугольник 1-Квадрат 2-Круг
    private String gname; // Название шаблона
    private String gtransliterations; //Название шаблона на английском маленькие буквы без пробелов
    private int gw; // Ширина шаблона 120 мм
    private int gh; // Высота шаблона 60 мм
    private int gbord; // Длина рамки шаблона в погонных метрах
    private int glenin; // Длина внутреннего узора без рамки в погонных метрах
    private int glenall; // Полная длина в погонных метрах всего шаблона
    private String gpathimg; // Путь к изображению шаблона
    private int materialid; // Названия материала 1-латунь, 2-медь, 3-сталь
    private String materialname; // Название материала
    private int size; // Толщина материала
    private BigDecimal totalNdc;

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public int getGtype() {
        return gtype;
    }

    public void setGtype(int gtype) {
        this.gtype = gtype;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public String getGtransliterations() {
        return gtransliterations;
    }

    public void setGtransliterations(String gtransliterations) {
        this.gtransliterations = gtransliterations;
    }

    public int getGw() {
        return gw;
    }

    public void setGw(int gw) {
        this.gw = gw;
    }

    public int getGh() {
        return gh;
    }

    public void setGh(int gh) {
        this.gh = gh;
    }

    public int getGbord() {
        return gbord;
    }

    public void setGbord(int gbord) {
        this.gbord = gbord;
    }

    public int getGlenin() {
        return glenin;
    }

    public void setGlenin(int glenin) {
        this.glenin = glenin;
    }

    public int getGlenall() {
        return glenall;
    }

    public void setGlenall(int glenall) {
        this.glenall = glenall;
    }

    public String getGpathimg() {
        return gpathimg;
    }

    public void setGpathimg(String gpathimg) {
        this.gpathimg = gpathimg;
    }

    public int getMaterialid() {
        return materialid;
    }

    public void setMaterialid(int materialid) {
        this.materialid = materialid;
    }

    public String getMaterialname() {
        return materialname;
    }

    public void setMaterialname(String materialname) {
        this.materialname = materialname;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public BigDecimal getTotalNdc() {
        return totalNdc;
    }

    public void setTotalNdc(BigDecimal totalNdc) {
        this.totalNdc = totalNdc;
    }
}
