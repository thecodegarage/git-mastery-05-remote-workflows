// Modal component
class Modal {
    constructor() {
        this.isOpen = false;
    }

    open(content) {
        this.isOpen = true;
        document.body.innerHTML += \`
            <div class="modal-overlay">
                <div class="modal-content">
                    ${ content }
                    <button onclick="modal.close()">Close</button>
                </div>
            </div>
        \`;
    }

    close() {
        this.isOpen = false;
        document.querySelector('.modal-overlay')?.remove();
    }
}

module.exports = Modal;
