<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>모나코 에디터 샘플</title>
  
  <link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css"/>
  <script type="text/javascript">
 
  	function a(){
		var c = editor.getValue();
		alert("dfsfsdf");
		var form = document.createElement("form");
        form.setAttribute("charset", "UTF-8");
        form.setAttribute("method", "Post");  //Post 방식
        form.setAttribute("action", "http://localhost:8080/code"); //요청 보낼 주소

        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "text");
        hiddenField.setAttribute("name", "code");
        hiddenField.setAttribute("value", c);
        
        document.body.appendChild(form);
        form.submit();

        var c = editor.getValue();
        $.ajax({
            url: "code",
            type: 'POST',
            data: {code:c},
            success: function(data) {
                         $("#result").html(data);
            }
        });
	 }
	
	 $("#btn1").click(function(){
	        var c = editor.getValue();
	        alert("asdfasdf");
	        $.ajax({
	            url: "code",
	            type: 'POST',
	            data: {code:c},
	            success: function(data) {
	                         $("#result").html(data);
	            }
	        });
	    });
	
  </script>
</head>
<body style="margin:0;">
	
  	 <script src="https://cdnjs.cloudflare.com/ajax/libs/require.js/2.3.6/require.min.js"></script>
  	 <script src="https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.16.2/min/vs/loader.js"></script>
  
    <form method="post" id="MyForm" onclick="a()">
    	<div class="form-group">
        	<label for="Title">Title</label>
        	<input id="Title" class="form-control" type="text" />
    	</div>

    	<div class="form-group">
        	<label for="Content">Content</label>
        	<div id="container" style="min-height: 600px"></div>
   		</div>

    	<button id="btn1" type="button" class="btn btn-primary" onclick="a()">Submit</button>
		<input type="hidden" name="content" id="content"/>
	</form>

  	<script>
    	var editor;    
    	require.config({ paths: { 'vs': 'https://cdnjs.cloudflare.com/ajax/libs/monaco-editor/0.16.2/min/vs' }});
    	require(['vs/editor/editor.main'], function() {
      	const editor = monaco.editor.create(document.getElementById('container'), {
        theme: 'vs-dark',
        fontFamily: 'Nanum Gothic Coding',
        automaticLayout: true,
        language: 'c',
        value: [
          '#include <stdio.h>',
          'int main(){',
          '\n',
          '    return 0;',
          '}'
        ].join('\n')
	      });

      	function setupFormPost() {
            var v = editor.getValue()
            alert(v);
            document.getElementById("content").value = v;
            // $("#code").val(value);
            // var temp= $("#code").val();
            //alert(value);
        }
	      
	    });
	    /*
    	const form = document.getElementById("MyForm");
        form.addEventListener("formdata", e =>
        {
            var value = editor.getModel().getValue();
            temp = editor.getValue();
            alert(value);
            e.formData.append('content', temp);
            $("#code").val(value);
            alert(value);			
        });
		*/
        
    	
     </script>
 
</body>
</html>