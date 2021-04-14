<div class='credit-card-form'>
<h1 class='info-input-haedline'>
  クレジットカード情報入力
</h1>
<div class="form-group">
  <div class='form-text-wrap'>
    <label class="form-text">カード情報</label>
    <span class="indispensable">必須</span>
  </div>
  <%= f.text_field 'hoge', class:"input-default", id:"card-number", placeholder:"カード番号(半角英数字)", maxlength:"16" %>
  <div class='available-card'>
    <%= image_tag 'card-visa.gif', class: 'card-logo'%>
    <%= image_tag 'card-mastercard.gif', class: 'card-logo'%>
    <%= image_tag 'card-jcb.gif', class: 'card-logo'%>
    <%= image_tag 'card-amex.gif', class: 'card-logo'%>
  </div>
</div>
<div class="form-group">
  <div class='form-text-wrap'>
    <label class="form-text">有効期限</label>
    <span class="indispensable">必須</span>
  </div>
  <div class='input-expiration-date-wrap'>
    <%= f.text_area 'hoge', class:"input-expiration-date", id:"card-exp-month", placeholder:"例)3" %>
    <p>月</p>
    <%= f.text_area 'hoge', class:"input-expiration-date", id:"card-exp-year", placeholder:"例)23" %>
    <p>年</p>
  </div>
</div>
<div class="form-group">
  <div class='form-text-wrap'>
    <label class="form-text">セキュリティコード</label>
    <span class="indispensable">必須</span>
  </div>
  <%= f.text_field "hoge",class:"input-default", id:"card-cvc", placeholder:"カード背面4桁もしくは3桁の番号", maxlength:"4" %>
</div>
</div>
