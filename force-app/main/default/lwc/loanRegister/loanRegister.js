import { LightningElement, api } from 'lwc';
import register from '@salesforce/apex/LoanRegisterController.register';

export default class LoanRegister extends LightningElement {
    loanRequest = {
        loanDate: (new Date()).toISOString().split('T')[0]
    };
    isLoading;
    isCompleted;
    error;

    handleChange(event) {
        switch (event.target.name) {
            case 'memberNumber':
                this.loanRequest.memberNumber = event.detail.value;
                break;
            case 'itemNumber':
                this.loanRequest.itemNumber = event.detail.value;
                break;
            case 'loanDate':
                this.loanRequest.loanDate = event.detail.value;
                break;
            default:
                break;
        }
    }

    doRegister() {
        this.showSpinner = true;
        this.isCompleted = false;

        register({ loanRequest: this.loanRequest })
            .then((result) => {
                if (result && result.isSuccess) {
                    this.isCompleted = true;
                    this.error = undefined;
                } else {
                    this.error = result;
                }
            })
            .catch((error) => {
                this.error = error;
            })
            .finaly(() => {
                this.showSpinner = false;
            });
    }
}