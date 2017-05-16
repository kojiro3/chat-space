$(function() {

  function buildHTML(message) {
    var html = {};
    html.body = $('<li class="chat__message">').append(message.body);
    html.date = $('<li class="chat__date">').append(message.created_at);
    html.name = $('<li class="chat__name">').append(message.name)
    if (message.image.url) {
      html.image = $(`<image src=${message.image.url} class="chat__image">`)
    }
    return html;
  }

  var message_ids = [];
  auto_reload();

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
      auto_reload();
      textField.val('');
      $(".send-button").prop("disabled", false);
    })
    .fail(function() {
      alert('メッセージを入力してください');
      $(".send-button").prop("disabled", false);
    });
  });

  function auto_reload() {
    var last_id = $(message_ids).last()[0];
    if (last_id) {
      $.ajax({
        type: 'GET',
        url: './messages/search',
        data: {
          last_id: last_id
        },
        dataType: 'json'
      })
      .done(function(data) {
        $.each(data, function(i, message) {
          var html = buildHTML(message);
          $('.chat').append(html.name, html.date, html.body, html.image);
          message_ids.push(message.id)
        });
      })
      .fail(function() {
      });
    } else {
      $.ajax({
        type: 'GET',
        url: './messages',
        dataType: 'json'
      })
      .done(function(data) {
        message_ids.push(data.id)
      })
      .fail(function() {
      });
    }
  };

  check = setInterval(auto_reload, 10000);

});
