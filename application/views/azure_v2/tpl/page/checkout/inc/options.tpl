[{block name="checkout_user_options"}]
    [{oxscript include="js/widgets/oxequalizer.min.js" priority=10}]
    [{oxscript add="$(window).load(function(){ if( !isMobileDevice() ) { oxEqualizer.equalHeight( $( '.checkoutOptions .panel .panel-body' ) ); } });"}]

    [{assign var="sColClass" value="col-lg-6"}]
    [{if $oView->getShowNoRegOption()}]
        [{assign var="sColClass" value="col-lg-4"}]
    [{/if}]

    <div class="checkoutOptions clear">
        [{block name="checkout_options_noreg"}]
            [{if $oView->getShowNoRegOption()}]
                <div class="col-md-12 [{$sColClass}]">
                    <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                        <div class="hidden">
                            [{$oViewConf->getHiddenSid()}]
                            [{$oViewConf->getNavFormParams()}]
                            <input type="hidden" name="cl" value="user">
                            <input type="hidden" name="fnc" value="">
                            <input type="hidden" name="option" value="1">
                        </div>

                        <div class="panel panel-default" id="optionNoRegistration">
                            <div class="panel-heading">
                                <h3 class="panel-title">[{oxmultilang ident="PAGE_CHECKOUT_USER_OPTION_NOREGISTRATION"}]</h3>
                            </div>
                            <div class="panel-body">
                                [{block name="checkout_options_noreg_text"}]
                                    <p>[{oxmultilang ident="PAGE_CHECKOUT_USER_OPTION_NOREGISTRATION_DESCRIPTION"}]</p>
                                    [{if $oView->isDownloadableProductWarning()}]
                                        <p class="errorMsg">[{oxmultilang ident="MESSAGE_DOWNLOADABLE_PRODUCT"}]</p>
                                    [{/if}]
                                [{/block}]
                            </div>
                            <div class="panel-footer text-right">
                                <button class="btn btn-primary submitButton nextStep" type="submit">[{oxmultilang ident="PAGE_CHECKOUT_USER_OPTION_NEXT"}] <i class="fa fa-caret-right"></i></button>
                            </div>
                        </div>
                    </form>
                </div>
            [{/if}]
        [{/block}]

        [{block name="checkout_options_reg"}]
            <div class="col-md-12 [{$sColClass}]">
                <form action="[{$oViewConf->getSslSelfLink()}]" method="post">
                    <div class="hidden">
                        [{$oViewConf->getHiddenSid()}]
                        [{$oViewConf->getNavFormParams()}]
                        <input type="hidden" name="cl" value="user">
                        <input type="hidden" name="fnc" value="">
                        <input type="hidden" name="option" value="3">
                    </div>

                    <div class="panel panel-default" id="optionRegistration">
                        <div class="panel-heading">
                            <h3 class="panel-title">[{oxmultilang ident="PAGE_CHECKOUT_USER_OPTION_REGISTRATION"}]</h3>
                        </div>
                        <div class="panel-body">
                            [{block name="checkout_options_reg_text"}]
                                <p>[{oxmultilang ident="PAGE_CHECKOUT_USER_OPTION_REGISTRATION_DESCRIPTION"}]</p>
                            [{/block}]
                        </div>
                        <div class="panel-footer text-right">
                            <button class="btn btn-primary submitButton nextStep" type="submit">[{oxmultilang ident="PAGE_CHECKOUT_USER_OPTION_NEXT"}] <i class="fa fa-caret-right"></i></button>
                        </div>
                    </div>
                </form>
            </div>
        [{/block}]

        [{block name="checkout_options_login"}]
            <div class="col-md-12 [{$sColClass}]">
                [{include file="form/login.tpl"}]
            </div>
        [{/block}]
    </div>
[{/block}]