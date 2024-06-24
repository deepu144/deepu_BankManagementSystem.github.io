document.addEventListener('DOMContentLoaded',disableTextArea);

function disableTextArea(){
    document.getElementById('username').disabled = true ;
    document.getElementById('name').disabled = true ;
    document.getElementById('dob').disabled = true ;
    document.getElementById('gender').disabled = true ;
    document.getElementById('mobile').disabled = true ;
    document.getElementById('city').disabled = true ;
    document.getElementById('state').disabled = true ;
    document.getElementById('zipcode').disabled = true ;
    document.getElementById('address').disabled = true ;
    document.getElementById('accStatus').disabled = true ;
    document.getElementById('accType').disabled = true ;
	document.getElementById('email').disabled = true ;

}

document.getElementById('edit').addEventListener('click',enableTextArea);

function enableTextArea(){
    document.getElementById('name').disabled = false ;
    document.getElementById('dob').disabled = false ;
    document.getElementById('gender').disabled = false ;
    document.getElementById('mobile').disabled = false;
    document.getElementById('city').disabled = false ;
    document.getElementById('state').disabled = false ;
    document.getElementById('zipcode').disabled = false ;
    document.getElementById('address').disabled = false ;
    document.getElementById('accStatus').disabled = false ;
    document.getElementById('accType').disabled = false ;
    document.getElementById('email').disabled = false ;


    document.getElementById('afterEditButton').classList.toggle('hideButton');
    document.getElementById('beforeEditButton').classList.toggle('hideButton');
}

document.getElementById('cancelButton').addEventListener('click',getToNormal);

function getToNormal(){
    document.getElementById('name').disabled = true ;
    document.getElementById('dob').disabled = true ;
    document.getElementById('gender').disabled = true ;
    document.getElementById('mobile').disabled = true ;
    document.getElementById('city').disabled = true ;
    document.getElementById('state').disabled = true ;
    document.getElementById('zipcode').disabled = true ;
    document.getElementById('address').disabled = true ;
    document.getElementById('accStatus').disabled = true ;
    document.getElementById('accType').disabled = true ;
    document.getElementById('email').disabled = true ;

    document.getElementById('afterEditButton').classList.toggle('hideButton');
    document.getElementById('beforeEditButton').classList.toggle('hideButton');
}

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
