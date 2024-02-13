{extends file="parent:frontend/index/index.tpl"}

{block name='frontend_index_header_title'}
    {s name="ordertrackerMetaTitle" namespace="frontend/account/order_tracker"}{/s}
{/block}

{block name='frontend_index_header_meta_description'}
    {s name="ordertrackerMetaDescription" namespace="frontend/account/order_tracker"}{/s}
{/block}

{block name="frontend_index_content"}
    <div class="custom-page--content content block">
        {if $magediaOrdertrackerWidgetId}
            <div id="ordertracker-title" class="panel--title is--hidden" style="font-size: 1.625rem; margin: 0">
                <span>{s name="Tracking" namespace="frontend/account/order_tracker"}{/s}</span>
                <span class="tracknumber"></span>
                <span>{s name="trackingCode" namespace="frontend/account/order_tracker"}{/s}</span>
            </div>
            <div id="ordertracker-widget" data-id="{$magediaOrdertrackerWidgetId}"></div>
            <script src="https://www.ordertracker.com/sdk.js"></script>
            <script>
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
            </script>
        {/if}
    </div>
{/block}
