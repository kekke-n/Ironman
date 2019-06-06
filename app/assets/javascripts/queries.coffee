# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http:#coffeescript.org/

$ ->
  $("#queryTable").DataTable {
    "lengthMenu": [[-1, 50, 100, 500, 1000], ["ALL", 50, 100, 500, 1000]],
    # ソート機能 無効
    # ordering: false,
    # ページング機能 無効
    paging: false
  }

  $('.csv_copy').click ->
    execCopy($('#csv_date').val())
  $('.tsv_copy').click ->
    execCopy($('#tsv_date').val())

  $(".sql-view").click ->
    $(this).css('display', 'none')
    $edit = $(".sql-edit")
    sql = $(".sql-code").text()
    lineHeight = parseInt($edit.css('lineHeight'))
    lines = (sql + "\n").match(/\n/g).length
    $(".sql-edit-form").css('display', '')
    $edit.height(lines * lineHeight).val(sql).focus()

  $(".sql-edit-cancel").click ->
    $(".sql-edit-form").css('display', 'none')
    $(".sql-view").css('display', '')

#SQLのシンタックスハイライトを有効にする
hljs.initHighlightingOnLoad()

execCopy(string) ->
  temp = document.createElement('div')

  temp.appendChild(document.createElement('pre')).textContent = string

  s = temp.style
  s.position = 'fixed'
  s.left = '-100%'

  document.body.appendChild(temp)
  document.getSelection().selectAllChildren(temp)

  result = document.execCommand('copy')

  document.body.removeChild(temp)
  # true なら実行できている falseなら失敗か対応していないか
  if result
    alert('コピーできました')
  else
    alert('このブラウザでは対応していません')
