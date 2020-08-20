"use strict";

$('#get-correction').on('submit', (evt) => {
  evt.preventDefault();

  const selectedId = $('#correction-id').val();

  $.get(`/api/correction/${selectedId}`, (res) => {
    $('#checklistid').html(res.checklistid);
    $('#questionnumber').html(res.questionnumber);
    $('#dateregistered').html(res.dateregistered);
  });
});

