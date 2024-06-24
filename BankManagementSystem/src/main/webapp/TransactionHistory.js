document.addEventListener('DOMContentLoaded',function(){
	document.getElementById('menu').addEventListener('click',()=>{
	    document.getElementById('dropdown').classList.toggle('hideDrop');
	})

	document.getElementById('goHome').addEventListener('click',openClientPage);
	document.getElementById('goTransferMoney').addEventListener('click',openTransferMoney);
	
	function openClientPage(){
		window.location.href = 'ClientWelcome.jsp';
	}
	
	function openTransferMoney(){
		window.location.href = 'TransferMoney.jsp';
	}
})


