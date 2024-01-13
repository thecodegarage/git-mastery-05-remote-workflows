// Toast notification system
class NotificationManager {
    show(message, type = 'info') {
        const notification = document.createElement('div');
        notification.className = \`notification notification-${ type }\`;
        notification.textContent = message;
        
        document.body.appendChild(notification);
        
        setTimeout(() => {
            notification.remove();
        }, 3000);
    }

    success(message) {
        this.show(message, 'success');
    }

    error(message) {
        this.show(message, 'error');
    }
}

module.exports = NotificationManager;
