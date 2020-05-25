



$(document).ready(function() {

	$('#btn').click(function() {
			$.ajax("eventMinusPoint.ev",{
				success: function(rdata) {
					$("#myCoupon").html(rdata);
				}
			})
			$.ajax({
				url: 'eventPull.ev',
				dataType: 'html',
				type: 'get',
				success: function(rdata) {
					
					var point = rdata.trim()/10000;
				
					if(rdata == 30000 || rdata == 50000 || rdata == 100000) {
				
						$('.p1').html("<img src='images/eventCoupon.png' class='img'><br>");
						$.ajax("eventWin.ev",{
							data: {"point": point},
							success: function() {
							
							}
						})
			    		$.ajax("eventPull.ev", {
			    			success: function(rdata) {
			    			
			    				if(rdata == 0) {
			    					setTimeout(function() {

			    						$.ajax("eventEnd.ev",{
				    						success: function() {
				    							location.reload();
				    							
				    						}
				    					});
											
			    					}, 4000);
			    					
			    			
			    				}

			    			}
			    		});
					}else if(rdata == 1) {
						$('.p1').html("<img src='images/x.PNG' class='img'><br>");
					}else {
						$('.p1').html("<img src='images/a.png'><br>");
						$("#btn").css('opacity','0').css('pointer-events','none');
						
						$.ajax("eventEnd.ev", {
							success: function() {
								
								location.reload();
							}
						})
						return false;
					}			
				
					$("#btn").css('opacity','0').css('pointer-events','none');
				
					
					setTimeout(function() {
						
						$(".p1").html("<img src='images/box.png' id='img'><br>");
						$("#btn").css('opacity','1').css('pointer-events','auto');
						
						}, 4000);
				},
				error: function() {
					alert("실패");				

				}
			});
	});
	$('#btn').mouseover(function() {
		
		$('#img').css('-webkit-animation','vibrate-1 0.3s linear infinite both').css('animation','vibrate-1 0.3s linear infinite both')
	});
	$('#btn').mouseout(function() {
		
		$('#img').css('-webkit-animation','').css('animation','');
	});
	

	
});


	$(document).ready(function() {
				
		var addDate = document.getElementById("hid").value;		
		var ts = new Date(addDate);
		var newYear = true;

    	if((new Date()) > ts){

			$('.p1').html("<img src='images/a.png' class='img'><br>");
			$("#btn").css('opacity','0').css('pointer-events','none');
 		
    		newYear = false;
    	}
    	
    	$('#countdown').empty();
    	
    	$('#countdown').countdown({
    		timestamp	: ts,
    		callback	: function(days, hours, minutes, seconds){
    		
    		}
    });
});