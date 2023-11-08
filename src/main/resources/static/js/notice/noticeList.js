
    	$('#box').on("click",".pageBtn",function(){
    		console.log(this);
    		let page = $(this).attr("data-p");
    		let kind = $('#kind').val();
    		let search = $('#search').val();
    		
    		pager(page, search, kind);
    	});
    	
    	$('#box').on("click",".pageBtn2",function(){
    		console.log(this);
    		let page = $(this).attr("data-p");
    		let kind = $('#kind').val();
    		let search = $('#search').val();
    		let category = $('.catCheck').attr("data-cat");
    		console.log(category);
    		catPager(page, search, kind, category);
    		
    	});
    	
    	$('#searchBtn').click(function(){
    		let page = 1;
    		let kind = $('#kind').val();
    		let search = $('#search').val();
    		pager(page, search, kind);
    		$('#search').val("");
    	});
    	
    	$('#searchBtn2').click(function(){
    		let page = 1;
    		let kind = $('#kind').val();
    		let search = $('#search').val();
    		let category = $('.catCheck').attr("data-cat");
    		console.log(category);
    		catPager(page, search, kind, category);
    		$('#search').val("");
    	});
    	
    	$('.category').click(function(){
    		let page = 1;
    		let kind = $('#kind').val();
    		let search = $('#search').val();
    		let category = $(this).attr("data-cat");
    		console.log(category);
    		catPager(page, search, kind, category);
    		$('#searchBtn').attr("id","searchBtn2");
    	});
    	
    	$('#total').click(function(){
    		let page = 1;
    		let kind = $('#kind').val();
    		let search = $('#search').val();
    		console.log(page);
    		pager(page, search, kind);
    		$('.btnChange').attr("id","searchBtn");
    	});
    	
    	function pager(page, search, kind){
    		$.ajax({
    			type:"get",
    			url:"./totallist",
    			data:{
    				"page":page,
    				"search":search,
    				"kind":kind
    					
    			},
    			success:function(response){
    				// result 페이지를 하나 만들어 준다.
    				
    				if (response != null) {
	    				console.log(response);
	    				$('#box').empty();
	    				$('#box').append(response);

    					} else {
    					console.log("list 가져오기 실패");
    					}
    			},
    			error:function(){
    				console.log("ajax 실패");
    			}
    			})
    	}
    	
    	function catPager(page, search, kind, category){
    		$.ajax({
    			type:"get",
    			url:"./categorylist",
    			data:{
    				"page":page,
    				"search":search,
    				"kind":kind,
    				"category":category
    					
    			},
    			success:function(response){
    				// result 페이지를 하나 만들어 준다.
    				
    				if (response != null) {
	    				console.log(response);
	    				$('#box').empty();
	    				$('#box').append(response);

    					} else {
    					console.log("list 가져오기 실패");
    					}
    			},
    			error:function(){
    				console.log("ajax 실패");
    			}
    			})
    	}
