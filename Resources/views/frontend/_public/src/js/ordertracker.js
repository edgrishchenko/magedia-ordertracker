document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.trackorder').forEach(function(button) {
        button.addEventListener('click', function() {
            const trackNumber = this.dataset.tracknumber;
            const orderNumber = this.dataset.ordernumber;

            const orderTrackerTitle = document.querySelector('#ordertracker-title');
            const orderTrackerNumber = document.querySelector('#ordertracker-title .ordernumber');
            const orderTrackerWidget = document.querySelector('#ordertracker-widget');

            orderTrackerTitle.classList.remove('is--hidden');
            orderTrackerNumber.innerHTML = orderNumber;

            orderTrackerWidget.innerHTML = '';

            Ordertracker({
                "id": orderTrackerWidget.dataset.id,
                "trackingNumber": trackNumber
            }).render('#ordertracker-widget')
        });
    });
});
