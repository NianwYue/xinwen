$(document).ready(function(){
	//加载新闻类别
	$.ajax({
		   type:'POST',
		   url:'bftype.do',
		   dataType:'json',
		   success:function(data){
			   $.each(data,function(index,item){
					$("#typeUi").append("<li><a href=\"bftop.do?method=type2News&curpag=1&curgrp=1&id="+item.id+"\">"+item.name+"</a></li>");		
						});
			   }
		   });   
	//加载头条新闻
	$.ajax({
		   	type:'POST',
		   	url:'bftop.do',
			data:'method=top',
			dataType:'json',
			success:function(data){
				$.each(data,function(index,message){
						$("#topls").append("<li><span class=\"category\">["+message.type.name+"]</span><a href=\"bftop.do?method=id2news&id="+message.id+"\">"+message.title+"</a><span class=\"date\">"+message.publishTime+"</span></li>");		 
									 });
				}
			})
	//	热点新闻
	$.ajax({
		   	type:'POST',
		   	url:'bftop.do',
			data:'method=hot',
			dataType:'json',
			success:function(data){
				$.each(data,function(index,message){
						$("#hotls").append("<li><span class=\"category\">["+message.type.name+"]</span><a href=\"bftop.do?method=id2news&id="+message.id+"\">"+message.title+"</a><span class=\"date\">"+message.publishTime+"</span></li>");		 
									 });
				}
			})
	});