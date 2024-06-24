document.getElementById('clientDetails').addEventListener('click',openAllClientsPage);
document.getElementById('accountDetails').addEventListener('click',openAccountDetailsPage);
document.getElementById('request').addEventListener('click' , openClientRequest);
document.getElementById('home').addEventListener('click' , openAdminMain);

function openAllClientsPage(){
	window.location.href = 'AllClients.jsp';
}

function openAccountDetailsPage(){
	window.location.href = 'AccountDetail.jsp';
}

function openClientRequest(){
	window.location.href = 'ClientRequest.jsp';
}

function openAdminMain(){
	window.location.href = 'AdminMain.jsp';
}

document.getElementById('logout').addEventListener('click',unHideLogoutBlock);

function unHideLogoutBlock(){
    document.getElementById('logoutBlock').classList.toggle('hide-logout');
    document.getElementById('sideBar').classList.toggle('show');
    document.getElementById('mainBlock').classList.toggle('show');
    document.getElementById('img').classList.toggle('show');

}

// document.getElementById('logoutButton').addEventListener('click',openWelcomePage);

document.getElementById('cancel').addEventListener('click',hideLogoutBlock);

function hideLogoutBlock(){
    document.getElementById('logoutBlock').classList.toggle('hide-logout');
    document.getElementById('sideBar').classList.toggle('show');
    document.getElementById('mainBlock').classList.toggle('show');
	document.getElementById('img').classList.toggle('show');

}
