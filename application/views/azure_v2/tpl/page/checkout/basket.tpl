[{assign var="oConfig" value=$oViewConf->getConfig()}]
[{capture append="oxidBlock_content"}]

    [{* ordering steps *}]
    [{include file="page/checkout/inc/steps.tpl" active=1}]

    [{block name="checkout_basket_main"}]
        [{assign var="currency" value=$oView->getActCurrency()}]

        [{if $oView->isLowOrderPrice()}]
            [{block name="checkout_basket_loworderprice_top"}]
                <div class="alert alert-info">[{oxmultilang ident="PAGE_CHECKOUT_BASKET_MINORDERPRICE"}] [{$oView->getMinOrderPrice()}] [{$currency->sign}]</div>
                <div class="spacer"></div>
            [{/block}]
        [{/if}]

        [{if !$oxcmp_basket->getProductsCount() }]
            [{block name="checkout_basket_emptyshippingcart"}]
                <div class="spacer"></div>
                <div class="alert alert-danger">
                    [{oxmultilang ident="PAGE_CHECKOUT_BASKET_EMPTYSHIPPINGCART"}]
                    <a href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]" class="btn btn-default btn-xs pull-right"><i class="fa fa-caret-left"></i> [{oxmultilang ident="DD_BASKET_BACK_TO_SHOP"}]</a>
                </div>
            [{/block}]
        [{else}]
            <div class="well well-sm clear">
                [{block name="checkout_basket_backtoshop_top"}]
                    [{if $oView->showBackToShop()}]
                        <form action="[{$oViewConf->getSslSelfLink()}]" method="post" class="pull-left">
                            <div class="hidden">
                                [{$oViewConf->getHiddenSid()}]
                                <input type="hidden" name="cl" value="basket">
                                <input type="hidden" name="fnc" value="backtoshop">
                            </div>
                            <button type="submit" class="btn btn-default submitButton largeButton pull-left">
                                <i class="fa fa-caret-left"></i> [{oxmultilang ident="PAGE_CHECKOUT_BASKET_CONTINUESHOPPING"}]
                            </button>
                        </form>
                    [{else}]
                        <a href="[{$oViewConf->getHomeLink()}]" class="btn btn-default submitButton largeButton pull-left">
                            <i class="fa fa-caret-left"></i> [{oxmultilang ident="PAGE_CHECKOUT_BASKET_CONTINUESHOPPING"}]
                        </a>
                    [{/if}]
                [{/block}]

                [{if !$oView->isLowOrderPrice()}]
                    [{block name="basket_btn_next_top"}]
                        <form action="[{$oViewConf->getSslSelfLink()}]" method="post" class="pull-right">
                            <div class="hidden">
                                [{$oViewConf->getHiddenSid()}]
                                <input type="hidden" name="cl" value="user">
                            </div>
                            <button type="submit" class="btn btn-primary submitButton largeButton nextStep pull-right">
                                [{oxmultilang ident="PAGE_CHECKOUT_BASKET_NEXTSTEP"}] <i class="fa fa-caret-right"></i>
                            </button>
                        </form>
                    [{/block}]
                [{/if}]
                <div class="clearfix"></div>
            </div>

            <div class="lineBox">
                [{include file="page/checkout/inc/basketcontents.tpl" editable=true}]
            </div>

            
            <div class="well well-sm clear">
                [{block name="checkout_basket_backtoshop_bottom"}]
                    [{if $oView->showBackToShop()}]
                        <form action="[{$oViewConf->getSslSelfLink()}]" method="post" class="pull-left">
                            <div class="backtoshop">
                                [{$oViewConf->getHiddenSid()}]
                                <input type="hidden" name="cl" value="basket">
                                <input type="hidden" name="fnc" value="backtoshop">
                                <button type="submit" class="btn btn-default submitButton largeButton pull-left">
                                    <i class="fa fa-caret-left"></i> [{oxmultilang ident="PAGE_CHECKOUT_BASKET_CONTINUESHOPPING"}]
                                </button>
                            </div>
                        </form>
                    [{else}]
                        <a href="[{$oViewConf->getHomeLink()}]" class="btn btn-default submitButton largeButton pull-left">
                            <i class="fa fa-caret-left"></i> [{oxmultilang ident="PAGE_CHECKOUT_BASKET_CONTINUESHOPPING"}]
                        </a>
                    [{/if}]
                [{/block}]

                [{if !$oView->isLowOrderPrice()}]
                    [{block name="basket_btn_next_bottom"}]
                        <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                            <div class="hidden">
                                [{$oViewConf->getHiddenSid()}]
                                <input type="hidden" name="cl" value="user">
                            </div>
                            <button type="submit" class="btn btn-primary submitButton largeButton nextStep pull-right">
                                [{oxmultilang ident="PAGE_CHECKOUT_BASKET_NEXTSTEP"}] <i class="fa fa-caret-right"></i>
                            </button>
                        </form>
                    [{/block}]
                [{/if}]
                <div class="clearfix"></div>
            </div>
        [{/if}]
        [{if $oView->isWrapping()}]
           [{include file="page/checkout/inc/wrapping.tpl"}]
        [{/if}]
    [{/block}]
    [{insert name="oxid_tracker" title=$template_title}]
[{/capture}]

[{include file="layout/page.tpl"}]