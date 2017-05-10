$(function() {
  function buildHTML(message) {
    var html = {};
    html.body = $('<li class="chat__message">').append(message.body);
    html.date = $('<li class="chat__date">').append(message.created_at);
    html.name = $('<li class="chat__name">').append(message.name)
    return html;
  }

  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.right-cont__message__field');
    var form = $(this).get()[0];
    var formData = new FormData(form);
    $.ajax({
      type: 'POST',
      url: './messages',
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.chat').append(html.name, html.date, html.body);
      textField.val('');
      $(".send-button").prop("disabled", false);
    })
    .fail(function() {
      alert('メッセージを入力してください');
      $(".send-button").prop("disabled", false);
    });
  });
});
