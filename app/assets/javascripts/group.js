$(function() {

  var list = $('.chat-group-form__users')
  var preWord;

  function appendList(user) {
    var user_name = $('<li class="chat-group-form__users__list">').append(user.name);
    var button = $(`<a href="" class="chat-group-form__users__button" data-name=${user.name} data-id=${user.id}>`).append('追加');
    list.append(user_name, button);
  }

  function appendName(name) {
    var list = $('.chat-group-user__name');
    var item = $('<li class="chat-group-user__name__list">').append(name);
    list.append(item);
  }

  function appendUserId(user_id) {
    var list = $('#chat-group-user-id');
    var item = $(`<input type="hidden" name="group[user_ids][]" value=${user_id}>`);
    list.append(item);
  }

  $('#user-search-field').on('keyup', function() {
    var user_name = $(this).val();
    if (user_name != preWord) {
      $('.chat-group-form__users').children().remove();
      if (user_name.length !== 0) {
        $.ajax({
          type: 'GET',
          url: '/groups/search',
          data: {
            keyword: user_name
          },
          dataType: 'json',
        })
        .done(function(data) {
          if (data.length !== 0) {
            $.each(data, function(i, user) {
              appendList(user);
            });
          } else {
              list.append('<li class="chat-group-form__users__list">一致するユーザーはいません');
          }
        })
        .fail(function() {
          alert('error');
        });
      }
      preWord = user_name
    }
  });
  $('.chat-group-form__users').on('click', '.chat-group-form__users__button', function(e) {
    e.preventDefault();
    var name = $(this).data('name');
    appendName(name);
    var user_id = $(this).data('id');
    appendUserId(user_id);
    $('.chat-group-form__users').children().remove();
    $('#user-search-field').val('');
  })
});
