var payload = {};
payload.token_type = 'bearer';
payload.issued_at = parseInt(context.getVariable('oauthv2accesstoken.OAuthV2.GenerateAccessToken.issued_at'));
payload.expires_in = parseInt(context.getVariable('oauthv2accesstoken.OAuthV2.GenerateAccessToken.expires_in'));
payload.access_token = context.getVariable('oauthv2accesstoken.OAuthV2.GenerateAccessToken.access_token');
var scope = context.getVariable('oauthv2accesstoken.OAuthV2.GenerateAccessToken.scope');
if(scope) {
	payload.scope = scope;
}
context.setVariable('response.header.Content-Type', 'application/json');
context.setVariable('response.content', JSON.stringify(payload, null, 4));
