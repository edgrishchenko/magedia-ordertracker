{extends file='parent:frontend/account/order_item.tpl'}

{block name="frontend_account_order_item_actions"}
    {$smarty.block.parent}

    {if $magediaOrdertrackerWidgetId && $offerPosition.trackingcode}
        <div class="order--actions panel--td column--actions" style="padding-top: 0">
            <button class="trackorder btn is--small"
                    data-tracknumber="{$offerPosition.trackingcode}"
                    data-ordernumber="{$offerPosition.ordernumber}">
                <span>{s name="Track" namespace="frontend/account/order_tracker"}{/s}</span>
            </button>
        </div>
    {/if}
{/block}
