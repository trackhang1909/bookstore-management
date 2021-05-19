/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.finalprojecthttt.models;

/**
 *
 * @author deptr
 */
public class ItemCart {

    private SachModel book;
    private int quantity;

    public ItemCart() {
    }

    public ItemCart(SachModel book, int quantity) {
        this.book = book;
        this.quantity = quantity;
    }

    public SachModel getBook() {
        return book;
    }

    public void setBook(SachModel book) {
        this.book = book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
