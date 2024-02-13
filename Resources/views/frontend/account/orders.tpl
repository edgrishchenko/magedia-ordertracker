{extends file='parent:frontend/account/orders.tpl'}

{block name="frontend_index_content"}
    {if $magediaOrdertrackerWidgetId}
        <div id="customer-ordertracker-title" class="panel--title is--hidden" style="font-size: 1.625rem; margin: 0">
            <span>{s name="Tracking" namespace="frontend/account/order_tracker"}{/s}</span>
            <span class="ordernumber"></span>
            <span>{s name="OrderColumnId"}{/s}</span>
        </div>
        <div id="customer-ordertracker-widget" data-id="{$magediaOrdertrackerWidgetId}"></div>
        <script src="https://www.ordertracker.com/sdk.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                document.querySelectorAll('.trackorder').forEach(function (button) {
                    button.addEventListener('click', function () {
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
            });
        </script>
    {/if}

    {$smarty.block.parent}
{/block}
