var version="8.0.2";

$(document).ready(function(){

    $.contextMenu({
        selector: 'figure:not(.back-directory), .list-view2 figure:not(.back-directory) ',
	autoHide:true,
	build: function($trigger) {
	    var options = {
	      callback: function(key, options) {
	      },
	      items: {}
	    };

	    if ($trigger.data('type')=="dir")
	      options.items.name = {name: $trigger.find('h4 a').html(),icon:'label', disabled:true };
	    else
	      options.items.name = {name: $trigger.find('h4 a').html()+"."+$trigger.find('.file-extension').html(),icon:'label', disabled:true };
	    if ($trigger.data('type')=="img") {
	      options.items.dimension = {name: $trigger.find('.img-dimension').html(),icon:"dimension", disabled:true };
	    }
	      options.items.size = {name: $trigger.find('.file-size').html(),icon:"size", disabled:true };
	      options.items.date = {name: $trigger.find('.file-date').html(),icon:"date", disabled:true };


	    return options;
	  }
    });

    $(document).on('contextmenu', function(e) {
	if (!$(e.target).is("figure"))
	   return false;
    });

    $('input[name=radio-sort]').click(function(){
        var li=$(this).data('item');
	$('.filters label').removeClass("btn-inverse");
	$('.filters label').find('i').removeClass('icon-white');
	$('#filter-input').val('');
	$('#'+li).addClass("btn-inverse");
	$('#'+li).find('i').addClass('icon-white');
        if(li=='ff-item-type-all'){
	    $('.grid li').show(300);
	}else{
            if($(this).is(':checked')){
                $('.grid li').not('.'+li).hide(300);
                $('.grid li.'+li).show(300);
            }
        }
    });

    var delay = (function(){
	var timer = 0;
	return function(callback, ms){
	    clearTimeout (timer);
	    timer = setTimeout(callback, ms);
	};
    })();

    if (parseInt($('#file_number').val()) > parseInt($('#file_number_limit_js').val())) var js_script=false;
    else var js_script=true;

    $('#filter-input').on('keyup',function(){
	var val=clean_filename($(this).val());
	$(this).val(val);
	delay(function(){
	    if (js_script) {
		$('ul.grid li').each(function(){
		    var _this = $(this);
		    if (val!="" && _this.data('name').toString().toLowerCase().indexOf(val.toLowerCase())==-1) {
			_this.hide(100);
		    }else{
			_this.show(100);
		    }
		});
	    }
	}, 300 );
    }).keypress(function(e) {
	if(e.which == 13) {
	    $('#filter').trigger('click');
	}
    });

    $('#filter').on('click',function(){
	var val=clean_filename($('#filter-input').val());
	window.location.href=$('#current_url').val()+"&filter="+val;
    });

    $('#info').on('click',function(){
	bootbox.alert('<center><img src="img/logo.jpg" alt="responsive filemanager"/><br/><br/><p><strong>RESPONSIVE filemanager v.'+version+'</strong><br/><a href="http://www.responsivefilemanager.com">responsivefilemanager.com</a></p><br/><p>Copyright © <a href="http://www.tecrail.com" alt="tecrail">Tecrail</a> - Alberto Peripolli. All rights reserved.</p><br/><p>License<br/><small><a rel="license" href="http://creativecommons.org/licenses/by-nc/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-nc/3.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/3.0/">Creative Commons Attribution-NonCommercial 3.0 Unported License</a>.</small></p></center>');
	});

    $('#uploader-btn').click(function(){
	    var path=$('#root').val()+$('#cur_dir').val()+"/";
	    path=path.substring(0, path.length - 1);

	    $('#iframe-container').html($('<iframe />', {
		name: 'JUpload',
		id:   'uploader_frame',
		src: "uploader/index.php?path="+path,
		frameborder: 0,
		width: "100%",
		height: 360
	    }));
	});

    $('#full-img').click(function(){
	    $('#previewLightbox').lightbox('hide');
    });

    $('.upload-btn').click(function(){
	    $('.uploader').show(500);
    });

    var sortDescending=$('#descending').val()=== 'true';
    $('.sorter').click(function(){
	_this=$(this);
	sortDescending=!sortDescending;
	if (js_script) {
	    sortUnorderedList('ul.grid',sortDescending,"."+_this.data('sort'));
	    $(' a.sorter').removeClass('descending').removeClass('ascending');
	    if (sortDescending)
		$('.sort-'+_this.data('sort')).addClass("descending");
	    else
		$('.sort-'+_this.data('sort')).addClass("ascending");
	}else{
	    window.location.href=$('#current_url').val()+"&sort_by="+_this.data('sort')+"&descending="+sortDescending;
	}
    });

    $('.close-uploader').click(function(){
	    $('.uploader').hide(500);
	    window.location.href = $('#refresh').attr('href') + '&' + new Date().getTime();
    });

    $('.preview').click(function(){
	    var _this = $(this);

	    $('#full-img').attr('src',_this.data('url'));
	    if(!_this.hasClass('disabled'))
		    show_animation();
	    return true;
    });

    $('.rename-file').click(function(){
	var _this = $(this);

	var file_container=_this.parent().parent().parent();
	var file_title=file_container.find('h4');
	var old_name=$.trim(file_title.text());
	bootbox.prompt($('#rename').val(),$('#cancel').val(),$('#ok').val(), function(name) {
	    name=clean_filename(name);
	    if (name !== null && name!=old_name) {
		execute_action('rename_file',_this.data('path'),_this.data('thumb'),name,file_container,'apply_file_rename');
	    }
	},old_name);
    });

    $('.rename-folder').click(function(){
	var _this = $(this);

	var file_container=_this.parent().parent().parent();
	var file_title=file_container.find('h4');
	var old_name=$.trim(file_title.text());
	bootbox.prompt($('#rename').val(),$('#cancel').val(),$('#ok').val(), function(name) {
	    name=clean_filename(name);
	    if (name !== null && name!=old_name) {
		execute_action('rename_folder',_this.data('path'),_this.data('thumb'),name,file_container,'apply_folder_rename');
	    }
	},old_name);
    });

    $('.delete-file').click(function(){
	var _this = $(this);

	bootbox.confirm(_this.data('confirm'),$('#cancel').val(),$('#ok').val(), function(result) {
	    if (result==true) {
		execute_action('delete_file',_this.data('path'),_this.data('thumb'),'','','');
		_this.parent().parent().parent().parent().remove();
	    }
	});
    });

    $('.delete-folder').click(function(){
	var _this = $(this);

	bootbox.confirm(_this.data('confirm'),$('#cancel').val(),$('#ok').val(), function(result) {
	    if (result==true) {
		execute_action('delete_folder',_this.data('path'),_this.data('thumb'),'','','');
		_this.parent().parent().parent().remove();
	    }
	});
    });

    $('.new-folder').click(function(){
	bootbox.prompt($('#insert_folder_name').val(),$('#cancel').val(),$('#ok').val(), function(name) {
	    if (name !== null) {
		name=clean_filename(name);
		var folder_path=$('#root').val()+$('#cur_dir').val()+ name;
		var folder_path_thumb=$('#cur_dir_thumb').val()+ name;
		$.ajax({
			  type: "POST",
			  url: "execute.php?action=create_folder",
			  data: {path: folder_path, path_thumb: folder_path_thumb}
			}).done(function( msg ) {
			window.location.href = $('#refresh').attr('href') + '&' + new Date().getTime();
		});
	    }
	},$('#new_folder').val());
    });

    $('.view-controller button').click(function(){
	    var _this = $(this);

	    $('.view-controller button').removeClass('btn-inverse');
	    $('.view-controller i').removeClass('icon-white');
	    _this.addClass('btn-inverse');
	    _this.find('i').addClass('icon-white');

	     $.ajax({
		url: "ajax_calls.php?action=view&type="+_this.data('value')
	    }).done(function( msg ) {
		if (msg!="") {
		    bootbox.alert(msg);
		}
	    });
	    if (typeof  $('ul.grid')[0] !== "undefined" &&  $('ul.grid')[0])
		$('ul.grid')[0].className = $('ul.grid')[0].className.replace(/\blist-view.*?\b/g, '');
	    if (typeof $('.sorter-container')[0] !== "undefined" && $('.sorter-container')[0])
		$('.sorter-container')[0].className = $('.sorter-container')[0].className.replace(/\blist-view.*?\b/g, '');

	    var value=_this.data('value');
	    $('#view').val(value);
	    $('ul.grid').addClass('list-view'+value);
	    $('.sorter-container').addClass('list-view'+value);
	    if (_this.data('value')>=1){
		fix_colums();
	    }
	    else{
		$('ul.grid li').css( "width",126);
		$('ul.grid figure').css( "width",122);
	    }
	});

	if (!Modernizr.touch) {
	    $('.tip').tooltip({placement: "bottom"});
	    $('.tip-left').tooltip({placement: "left"});
	    $('.tip-right').tooltip({placement: "right"});
	    $('body').addClass('no-touch');
	}else{

	    $('#help').show();

	    //Enable swiping...
	    $(".box:not(.no-effect)").swipe( {
		    //Generic swipe handler for all directions
		    swipeLeft:swipe_reaction,
		    swipeRight:swipe_reaction,
		    //Default is 75px, set to 0 for demo so any distance triggers swipe
	       threshold:30
	    });
	}

	if(!Modernizr.csstransitions) { // Test if CSS transitions are supported

		$('figure').bind('mouseover',function(){
			if ($('#view').val()==0) {
				$(this).find('.box').animate({top: "-30px"} ,{queue:false,duration:300});
			}
		});

		$('figure').mouseout(function(){
			if ($('#view').val()==0) {
				$(this).find('.box').animate({top: "0px"} ,{queue:false,duration:300});
			}
		});

	}

	$(window).resize(function(){fix_colums(); });
	fix_colums();

	$('.link').click(function(){
		var _this = $(this);

		window[_this.data('function')](_this.data('file'),_this.data('field_id'));
	});


});


function fix_colums() {

    var width=$('.ff-container').width()-2;
    $('.uploader').css('width',width-6);
    if($('#view').val()>=1){
	if ($('#view').val()==1) {
	    var col=1
	}else{
	    var col=Math.floor(width/380);
	    if (col==0){
		col=1;
		$('h4').css('font-size',12);
	    }
	}
	width=Math.floor((width/col)-3);
	$('ul.grid li, ul.grid figure').css( "width", width);
	$('#help').hide();
    }else{if(Modernizr.touch) {
	    $('#help').show();
    }}
}

function swipe_reaction(event, direction, distance, duration, fingerCount) {
	var _this = $(this);

    if ($('#view').val()==0) {

		if (_this.attr('toggle')==1) {
			_this.attr('toggle',0);
			_this.animate({top: "0px"} ,{queue:false,duration:300});
		}else{
			_this.attr('toggle',1);
			_this.animate({top: "-30px"} ,{queue:false,duration:300});
		}

    }
}

function apply(file,external){
    if ($('#popup').val()==1) var window_parent=window.opener; else var window_parent=window.parent;
    var path = $('#cur_dir').val();
    //path = path.replace('\\', '/');
    var base_url = $('#base_url').val();
    var alt_name=file.substr(0, file.lastIndexOf('.'));
    var ext=file.split('.').pop();
    var fill='';
    if($.inArray(ext, ext_img) > -1){
        fill='<img src="'+path+file+'" alt="'+alt_name+'" />';
    }else{
	fill='<a href="'+path+file+'" title="'+alt_name+'">'+alt_name+'</a>';
    }

    parent.tinymce.activeEditor.insertContent(fill);
    parent.tinymce.activeEditor.windowManager.close();
}



function apply_link(file,external){
    if ($('#popup').val()==1) var window_parent=window.opener; else var window_parent=window.parent;
    var path = $('#cur_dir').val();
    path = path.replace('\\', '/');
    var base_url = $('#base_url').val();
    if (external!=""){
	var target = $('#'+external,window_parent.document);
	$(target).val(base_url+path+file);
	close_window();
    }
    else
	apply_any(path, file);
}

function apply_img(file,external){
    if ($('#popup').val()==1) var window_parent=window.opener; else var window_parent=window.parent;
    var path = $('#cur_dir').val();
    path = path.replace('\\', '/');
    var base_url = $('#base_url').val();

    if (external!=""){
	var target = $('#'+external, window_parent.document);
	$(target).val(base_url+path+file);
	close_window();
    }
    else
        apply_any(path, file);
}

function apply_video(file,external){
    if ($('#popup').val()==1) var window_parent=window.opener; else var window_parent=window.parent;
    var path = $('#cur_dir').val();
    path = path.replace('\\', '/');
    var base_url = $('#base_url').val();
    if (external!=""){
	var target = $('#'+external,window_parent.document);
	$(target).val(base_url+path+file);
	close_window();
    }
    else
	apply_any(path, file);
}

function apply_none(file,external){
	return;
}

function apply_any(path, file) {
	path = path.replace('\\', '/');
	parent.tinymce.activeEditor.windowManager.getParams().setUrl(path+file);
	parent.tinymce.activeEditor.windowManager.close();
	return false;
}

function close_window() {
    parent.jQuery.fancybox.getInstance().close();
}


function apply_file_rename(container,name) {
    container.find('h4').find('a').text(name);

    //select link
    var link=container.find('a.link');
    var file=link.data('file');
    var extension=file.substring(file.lastIndexOf('.') + 1);
    link.data('file',name+"."+extension);

    //preview link
    var link2=container.find('a.preview');
    var file= link2.data('url');
    if (typeof file !=="undefined" && file) {
	var old_name=file.substring(file.lastIndexOf('/') + 1);
	link2.data('url',file.replace(old_name,name+"."+extension));
    }

    //rename link && delete link
    var link3=container.find('a.rename-file');
    var link4=container.find('a.delete-file');
    var path_old=link3.data('path');
    var path_thumb=link3.data('thumb');
    var new_path=path_old.replace(old_name,name+"."+extension);
    var new_thumb=path_thumb.replace(old_name,name+"."+extension);
    link3.data('path',new_path);
    link3.data('thumb',new_thumb);
    link4.data('path',new_path);
    link4.data('thumb',new_thumb);
}

function apply_folder_rename(container,name) {
    var old_name=container.find('h4').find('a').text();
    container.find('h4').find('a').text(name);

    //select link
    var link=container.find('.folder-link');
    var url=link.attr('href');
    var fldr=$('#fldr_value').val();
    link.attr('href',url.replace('fldr='+fldr+old_name,'fldr='+fldr+name));

    //rename link && delete link
    var link2=container.find('a.delete-folder');
    var link3=container.find('a.rename-folder');
    var path_old=link3.data('path');
    var thumb_old=link3.data('thumb');
    var index = path_old.lastIndexOf('/');
    var new_path = path_old.substr(0, index + 1)+name;
    link2.data('path',new_path);
    link3.data('path',new_path);
    var index = thumb_old.lastIndexOf('/');
    var new_path = thumb_old.substr(0, index + 1)+name;
    link2.data('thumb',new_path);
    link3.data('thumb',new_path);

}

function replace_last(str,find,replace) {
	var re= new RegExp(find+"$");
	return str.replace(re, replace);
}

function RemoveAccents(strAccents) {
       strAccents = strAccents.split('');
       var strAccentsOut = new Array();
       var strAccentsLen = strAccents.length;
       var accents = 'ÀÁÂÃÄÅàáâãäåÒÓÔÕÕÖØòóôõöøÈÉÊËèéêëðÇçÐÌÍÎÏìíîïÙÚÛÜùúûüÑñŠšŸÿýŽž';
       var accentsOut = "AAAAAAaaaaaaOOOOOOOooooooEEEEeeeeeCcDIIIIiiiiUUUUuuuuNnSsYyyZz";
       for (var y = 0; y < strAccentsLen; y++) {
	       if (accents.indexOf(strAccents[y]) != -1) {
		       strAccentsOut[y] = accentsOut.substr(accents.indexOf(strAccents[y]), 1);
	       } else
		       strAccentsOut[y] = strAccents[y];
       }
       strAccentsOut = strAccentsOut.join('');
       return strAccentsOut;
}


function clean_filename(stri) {
    if (stri!=null) {
	strii=RemoveAccents(stri);
	strii=strii.replace(/[^A-Za-z0-9\.\-\ \_]+/g, '');

	return $.trim(strii.toLowerCase());
    }
    return null;
}

function execute_action(action,file1,file2,name,container,function_name){
    name=clean_filename(name);
    $.ajax({
	type: "POST",
	url: "execute.php?action="+action,
	data: {path: file1, path_thumb: file2, name: name.replace('/','')}
    }).done(function( msg ) {
	if (msg!="") {
	    bootbox.alert(msg);
	    return false;
	}else{
	    if (function_name!="") {
		window[function_name](container,name);
	    }
	}
	return true;
    });
}


function sortUnorderedList(ul, sortDescending,sort_field) {
    if(typeof ul == "string")
      ul = $(ul);
    var lis_dir = ul.find("li.dir");
    var lis_file = ul.find("li.file");
    var vals_dir = [];
    var values_dir = [];
    var vals_file = [];
    var values_file = [];

    $.each(lis_dir,function(index){
	var _this=$(this);
	var value=_this.find(sort_field).val();
	if ($.isNumeric(value)) {
	    value=parseFloat(value);
	    while (typeof vals_dir[value] !== "undefined" &&  vals_dir[value] ) {
		value=parseFloat(parseFloat(value)+parseFloat(0.001));
	    }
	}else{
	    value=value+"a"+_this.find('h4 a').data('file');
	}
	vals_dir[value]=_this.html();
	values_dir.push(value);
	});

    $.each(lis_file,function(index){
	var _this=$(this);
	var value=_this.find(sort_field).val();
	if ($.isNumeric(value)) {
	    value=parseFloat(value);
	    while (typeof vals_file[value] !== "undefined" &&  vals_file[value] ) {
		value=parseFloat(parseFloat(value)+parseFloat(0.001));
	    }
	}else{
	    value=value+"a"+_this.find('h4 a').data('file');
	}
	vals_file[value]=_this.html();
	values_file.push(value);
	});

    if ($.isNumeric(values_dir[0])) {
	values_dir.sort(function(a,b){return parseFloat(a)-parseFloat(b);});
    }else{
	values_dir.sort();
    }

    if ($.isNumeric(values_file[0])) {
	values_file.sort(function(a,b){return  parseFloat(a)-parseFloat(b); });
    }else{
	values_file.sort();
    }

    if(sortDescending){
	values_dir.reverse();
	values_file.reverse();
    }

    $.each(lis_dir,function(index){
	var _this=$(this);
	_this.html(vals_dir[values_dir[index]]);
    });

    $.each(lis_file,function(index){
	var _this=$(this);
	_this.html(vals_file[values_file[index]]);
    });

}

function show_animation()
{
    $('#loading_container').css('display', 'block');
    $('#loading').css('opacity', '.7');
}

function hide_animation()
{
	$('#loading_container').fadeOut();
}

