
<div id="summary-extra">
<div class="crm-summary-row">
  <div class="crm-label">
    Membership Type
  </div>
  <div class="crm-content">

{crmAPI var='memberships' entity='Membership' action='get' contact_id="$contactId"}
{foreach from=$memberships.values item=membership}
{crmAPI var='mtypes' entity='MembershipType' action='get' return="name" id=$membership.membership_type_id}
{foreach from=$mtypes.values item=membershiptype}
{$membershiptype.name}
{/foreach}
{/foreach}
  </div>
</div>


<div class="crm-summary-row">
  <div class="crm-label">
    Total Contributions
  </div>
  <div class="crm-content">

{assign var='total_contribs' value=0}
{crmAPI var='result' entity='Contribution' action='get' return="total_amount" contact_id="$contactId"}
{foreach from=$result.values item=contribution}
{assign var='total_contribs' value=$total_contribs+$contribution.total_amount"}
{/foreach}
{$total_contribs}
  </div>
</div>
</div>

{literal}
<script>
CRM.$(function($){
  $('#summary-extra').appendTo($('#contact-summary .contactCardRight .crm-summary-block'));
});
</script>
{/literal}