document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.trackorder').forEach(function(button) {
        button.addEventListener('click', function() {
            const trackNumber = this.dataset.tracknumber;
            const orderNumber = this.dataset.ordernumber;

            const orderTrackerTitle = document.querySelector('#customer-ordertracker-title');
            const orderTrackerNumber = document.querySelector('#customer-ordertracker-title .ordernumber');
            const orderTrackerWidget = document.querySelector('#customer-ordertracker-widget');

            orderTrackerTitle.classList.remove('is--hidden');
            orderTrackerNumber.innerHTML = orderNumber;

            orderTrackerWidget.innerHTML = '';

            Ordertracker({
                "id": orderTrackerWidget.dataset.id,
                "trackingNumber": trackNumber
            }).render('#customer-ordertracker-widget');
        });
    });

    const orderTrackerWidget = document.querySelector('#ordertracker-widget');

    if (orderTrackerWidget) {
        const params = new URLSearchParams(document.location.search);

        const trackNumber = params.get('tracking-number');

        if (trackNumber) {
            document.querySelector('#ordertracker-title .tracknumber').innerHTML = trackNumber;
            document.querySelector('#ordertracker-title').classList.remove('is--hidden');

            Ordertracker({
                "id": orderTrackerWidget.dataset.id,
                "trackingNumber": trackNumber
            }).render('#ordertracker-widget');
        }
    }
});
