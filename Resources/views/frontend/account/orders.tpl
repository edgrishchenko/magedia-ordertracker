{extends file='parent:frontend/account/orders.tpl'}

{block name="frontend_index_content"}
    {if $magediaOrdertrackerWidgetId}
        <div id="ordertracker-title" class="panel--title is--hidden" style="font-size: 1.625rem; margin: 0">
            <span>{s name="Tracking" namespace="frontend/account/order_tracker"}{/s}</span>
            <span class="ordernumber"></span>
            <span>{s name="OrderColumnId"}{/s}</span>
        </div>
        <div id="ordertracker-widget" data-id="{$magediaOrdertrackerWidgetId}"></div>
        <script src="https://www.ordertracker.com/sdk.js"></script>
    {/if}

    {$smarty.block.parent}
{/block}
