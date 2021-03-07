# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#address_zipcode").jpostal({
    # 郵便番号の入力欄が一つの場合
    # 111-1111と1111111のどちらの入力形式でも住所を自動入力してくれる
    postcode : ["#address_zipcode"],

    # 郵便番号の入力欄が3桁ｰ4桁で分かれている場合
    # postcode : ["#zipcode1","zipcode2"]

    # 入力項目フォーマット
    # ％3都道府県
    # ％4市区町村
    # ％5町域
    # ％6大口事業所の番地
    # ％7大口事業所の名称
    address : {
      "#user_prefecture_code"    : "%3",
      "#address_city"            : "%4%5",
      "#address_street"          : "%6%7"
      }
    })