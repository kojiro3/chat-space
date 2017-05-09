$(function() {
  function buildHTML(message, name) {
    var html = { body: '', date: '', name: '' };
    html.body = $('<li class="chat__message">').append(message.body);
    html.date = $('<li class="chat__date">').append(message.created_at);
    html.name = $('<li class="chat__name">').append(name)
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
      var name = formData.get(
"message[current_user_name]")
      var html = buildHTML(data, name);
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
