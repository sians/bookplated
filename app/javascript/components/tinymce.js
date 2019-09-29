const initTiny = () => {
  if (typeof tinyMCE != 'undefined') {
    tinyMCE.init({
      selector: "textarea.tinymce",
      toolbar: [
        "styleselect | bold italic | alignleft aligncenter alignright alignjustify",
        "bullist numlist outdent indent | code | codesample"
      ],
      plugins: "code,codesample,autoresize,imagetools,media,table,insertdatetime,charmap,print,preview,anchor,searchreplace,visualblocks,fullscreen"
    });
  } else {
    setTimeout(arguments.callee, 50);
  }
}

export { initTiny };
