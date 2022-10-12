import { LightningElement, track } from 'lwc';
import saveOrder from '@salesforce/apex/ShoppingCartService.saveOrder'
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ShoppingCart extends LightningElement {
    prevHistory = true
    newPurchase = false
    invoiceShow = false
    @track cartProducts = []


    showProduct() {
        this.prevHistory = !this.prevHistory;
        this.newPurchase = !this.newPurchase;
        console.log(this.newPurchase);
    }
    handleCheckOut(event) {
        this.newPurchase = !this.newPurchase;
        this.invoiceShow = !this.invoiceShow;
        this.cartProducts = event.detail;
    }
    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
        });
        this.dispatchEvent(event);
    }
    handleOnPlace(event) {
        saveOrder({ items: JSON.stringify(event.detail) })
            .then(result => {
                let title = 'success';
                let message = `${result} Successfully Order Placed`;
                let variant = 'success';
                this.showToast(title, message, variant);
                setTimeout(function () {
                    window.location.reload();
                }, 5000);
            })
            .catch(error => { console.log(error) });
    }
}