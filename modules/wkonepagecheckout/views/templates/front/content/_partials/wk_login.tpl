{**
* NOTICE OF LICENSE
*
* All rights reserved,
* Please go through LICENSE.txt file inside our module
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade this module to newer
* versions in the future. If you wish to customize this module for your
* needs please refer to CustomizationPolicy.txt file inside our module for more information.
*
*  @author    Webkul IN
*  @copyright since 2010 Webkul
*  @license   LICENSE.txt
*}
{* <div class="modal fade" id="wk_login_pop" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel"><i class="material-icons">&#xE851;</i>{l s='Log in' mod='wkonepagecheckout'}</h4>
			</div>
			<form method="POST" action="{url entity='module' name='wkonepagecheckout' controller='wkcheckout'}" id="wk-login-form" name="wk-login-form">
				<div class="modal-body">
					<div class="alert alert-danger wk-login-error wkhide"></div>
						<div class="form-group">
							<div class="input-group">
								<input type="text" class="form-control" name="wk-login-email" id="wk-login-email" placeholder="{l s='Email' mod='wkonepagecheckout'}">
								<label class="input-group-addon wk-icon">
									<i class="material-icons">&#xE851;</i>
								</label>
							</div>
						</div>

						<div class="form-group">
							<div class="input-group">
								<input type="password" class="form-control" name="wk-login-password" id="wk-login-password" placeholder="{l s='Password' mod='wkonepagecheckout'}">
								<label for="uPassword" class="input-group-addon wk-icon toggle-pwd-field">
									<i class="material-icons">visibility</i>
								</label>
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<img class="wk-loader wkhide" src="{$wk_opc_modules_dir}img/p_loading.gif" width="25">
					<button class="btn btn-primary" id="wk-submit-login">
						{l s='Login' mod='wkonepagecheckout'}
					</button>
					<div class="wkforgot">
						<a href="{$urls.pages.password}" class="forget">{l s='Forgot your password?' mod='wkonepagecheckout'}</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div> *}

<form method="POST" action="{url entity='module' name='wkonepagecheckout' controller='wkcheckout'}" id="wk-login-form" name="wk-login-form">
	<div class="alert alert-danger wk-login-error wkhide"></div>
		<div class="form-group">
			<div class="input-group">
				<input type="text" class="form-control" name="wk-login-email" id="wk-login-email" placeholder="{l s='Email' mod='wkonepagecheckout'}">
				<label class="input-group-addon wk-icon">
					<i class="material-icons">&#xE851;</i>
				</label>
			</div>
		</div>

		<div class="form-group">
			<div class="input-group">
				<input type="password" class="form-control" name="wk-login-password" id="wk-login-password" placeholder="{l s='Password' mod='wkonepagecheckout'}">
				<label for="uPassword" class="input-group-addon wk-icon toggle-pwd-field">
					<i class="material-icons">visibility</i>
				</label>
			</div>
		</div>
	<img class="wk-loader wkhide" src="{$wk_opc_modules_dir}img/p_loading.gif" width="25">
	<button class="btn btn-primary" id="wk-submit-login">
		{l s='Login' mod='wkonepagecheckout'}
	</button>
	<div class="wkforgot">
		<a href="{$urls.pages.password}" class="forget">{l s='Forgot your password?' mod='wkonepagecheckout'}</a>
	</div>
</form>
