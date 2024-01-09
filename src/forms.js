// Form handling
class FormHandler {
    constructor() {
        this.forms = new Map();
    }

    handleSubmit(formId, callback) {
        const form = document.getElementById(formId);
        form.addEventListener('submit', (e) => {
            e.preventDefault();
            const formData = new FormData(form);
            const data = Object.fromEntries(formData);
            callback(data);
        });
    }
}

module.exports = FormHandler;
