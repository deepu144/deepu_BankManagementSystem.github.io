document.addEventListener('DOMContentLoaded',function(){
	document.getElementById('menu').addEventListener('click',()=>{
    	document.getElementById('dropdown').classList.toggle('hideDrop');
	})

	document.getElementById('home').addEventListener('click',openClientPageFromTransferMoney);
	document.getElementById('transactionHistory').addEventListener('click',openTransactionHistoryFromTransferMoney);
	
	function openClientPageFromTransferMoney(){
		window.location.href = 'ClientWelcome.jsp';
	}
	
	function openTransactionHistoryFromTransferMoney(){
		window.location.href = 'TransactionHistory.jsp';
	}
})

