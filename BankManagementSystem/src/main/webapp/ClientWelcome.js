document.getElementById('transfermoney').addEventListener('click',openTransferMoneyPage);
document.getElementById('history').addEventListener('click',openTransactionHistoryPage);
//document.getElementById('viewAll').addEventListener('click',openTransactionHistoryPage);
document.getElementById('logout').addEventListener('click',unHideLogoutBlock);
document.getElementById('cancel').addEventListener('click',hideLogoutBlock);

function openTransactionHistoryPage(){
	window.location.href = 'TransactionHistory.jsp';
}

function openTransferMoneyPage(){
	window.location.href = 'TransferMoney.jsp';
}

function unHideLogoutBlock(){
	console.log("Hello");
    document.getElementById('logoutBlock').classList.toggle('hide-logout');
    document.getElementById('sideBar').classList.toggle('show');
    document.getElementById('mainBlock').classList.toggle('show');
}

function hideLogoutBlock(){
    document.getElementById('logoutBlock').classList.toggle('hide-logout');
    document.getElementById('sideBar').classList.toggle('show');
    document.getElementById('mainBlock').classList.toggle('show');
}