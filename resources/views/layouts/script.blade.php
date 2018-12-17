<script>
$(function() {
tinymce.init({
    selector:'#article',
    theme:'modern',
    branding: false,
    menubar: false,
    language: "id",
    skin: "lightgray",
    plugins: [
        "advlist autolink link image lists charmap print preview hr anchor pagebreak",
        "searchreplace wordcount visualblocks visualchars insertdatetime media nonbreaking",
        "table contextmenu directionality emoticons paste textcolor responsivefilemanager code"
    ],
    toolbar1: "undo redo | bold italic underline | alignleft aligncenteralignright alignjustify | bullist numlist outdent indent | styleselect",
    toolbar2: "| responsivefilemanager | link unlink anchor | image media| forecolor backcolor | print preview code ",
    image_advtab: true,
    relative_urls:true,
    external_filemanager_path: "{!! str_finish(asset('js/filemanager'),'/') !!}",
    external_filemanager_path: "/js/filemanager/",
    filemanager_title:"Responsive Filemanager" ,
    external_plugins: { "filemanager" : "/js/filemanager/plugin.min.js"}
});

    $('[data-fancybox]').fancybox({
    iframe : {
        preload : false,
            css : {
                width : '900px',
                height: '600px',
            }
    }
    });
});
</script>