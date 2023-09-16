function showErrorStyle(inputElement, errorMessage) {
	if (!inputElement.parentNode.querySelector('.error-message')) {
		inputElement.parentNode.appendChild(errorMessage).style.color;
		inputElement.style.borderColor = 'red';
	}
}

function green(inputElement, inputElement2) {
	inputElement.style.borderColor = 'green';
	inputElement2.style.borderColor = 'green';
}

function showError(inputElement, errorMessage, inputElement2, errorMessage2) {
	if (inputElement.value.trim() === '' || inputElement2.value.trim() === '') {
		if (inputElement.value.trim() === '') showErrorStyle(inputElement, errorMessage);
		else {
			removeErrorStyle(inputElement, errorMessage);
			inputElement.style.borderColor = 'green';
		}
		if (inputElement2.value.trim() === '') showErrorStyle(inputElement2, errorMessage2);
		else {
			removeErrorStyle(inputElement2, errorMessage2);
			inputElement2.style.borderColor = 'green';
		}
	}
}

function showError2(inputElement, errorMessage, errorMessage2) {
	if (inputElement.value.trim() === '') { showErrorStyle(inputElement, errorMessage); }

	else if (!(/@/.test(inputElement.value))) {
		showErrorStyle(inputElement, errorMessage2)
	}

	else {
		removeErrorStyle(inputElement, errorMessage);
		removeErrorStyle(inputElement, errorMessage2);
		inputElement.style.borderColor = 'green';
	}

}


function removeErrorStyle(inputElement, errorMessage) {
	if (inputElement.value.length > 0 && inputElement.parentNode.querySelector('.error-message') && inputElement.parentNode.contains(errorMessage)) {
		inputElement.parentNode.removeChild(errorMessage);
		inputElement.style.borderColor = null;
	}

	if (inputElement.value.trim() === '') {
		inputElement.style.borderColor = null;
	}
}

function showNumberError(inputElement, errorMessage, errorMessage2) {

	if (inputElement.value.trim() === '') {
		showErrorStyle(inputElement, errorMessage);
	}

	else if (!(/^[0-9]+$/.test(inputElement.value))) showErrorStyle(inputElement, errorMessage2);

	else {
		removeErrorStyle(inputElement, errorMessage);
		removeErrorStyle(inputElement, errorMessage2);
		inputElement.style.borderColor = 'green';
	}
}

function removeNumberErrorStyle(inputElement, errorMessage) {
	if (inputElement.value.length > 0 && inputElement.parentNode.querySelector('.error-message')) {
		inputElement.parentNode.removeChild(errorMessage);
		inputElement.style.borderColor = null;
	}

	if (inputElement.value.trim() === '') {
		inputElement.style.borderColor = null;
	}
}


const slidePage = document.querySelector(".slide-page");
const nextBtnFirst = document.querySelector(".firstNext");
const prevBtnSec = document.querySelector(".prev-1");
const nextBtnSec = document.querySelector(".next-1");
const prevBtnThird = document.querySelector(".prev-2");
const nextBtnThird = document.querySelector(".next-2");
const prevBtnFourth = document.querySelector(".prev-3");
const submitBtn = document.querySelector(".submit");
const progressText = document.querySelectorAll(".step p");
const progressCheck = document.querySelectorAll(".step .check");
const bullet = document.querySelectorAll(".step .bullet");
let current = 1;


const nameInput = document.getElementById('name');
const surnameInput = document.getElementById('surname');
const emailInput = document.getElementById('email');
const phoneInput = document.getElementById('phone');
const cityInput = document.getElementById('city');
const addressInput = document.getElementById('address');
const usernameInput = document.getElementById('username');
const passwordInput = document.getElementById('password');

const inputElements = [nameInput, cityInput, usernameInput];
const inputElements2 = [surnameInput, addressInput, passwordInput];

const errorMessage = document.createElement('div');
errorMessage.className = 'error-message';
errorMessage.innerText = 'Spazio vuoto';
errorMessage.style.color = 'red'

const errorMessage2 = document.createElement('div');
errorMessage2.className = 'error-message';
errorMessage2.innerText = 'Spazio vuoto';
errorMessage2.style.color = 'red'

const errorMessageNumber = document.createElement('div');
errorMessageNumber.className = 'error-message';
errorMessageNumber.innerText = 'Inserisci solo numeri';
errorMessageNumber.style.color = 'red'

const errorMessageEmail = document.createElement('div');
errorMessageEmail.className = 'error-message';
errorMessageEmail.innerText = '@ non presente';
errorMessageEmail.style.color = 'red'

nextBtnFirst.addEventListener("click", function(event) {
	event.preventDefault();

	showError(nameInput, errorMessage, surnameInput, errorMessage2);

	if (nameInput.value.trim() !== '' && surnameInput.value.trim() !== '') {
		nextBtnFirst.disabled = true;
		setTimeout(function() {
			nextBtnFirst.disabled = false;
		}, 500);
		green(nameInput, surnameInput);
		setTimeout(function() {
			slidePage.style.marginLeft = "-25%";
			bullet[current - 1].classList.add("active");
			progressCheck[current - 1].classList.add("active");
			progressText[current - 1].classList.add("active");
			current += 1;
		}, 75);
	}
});


nextBtnSec.addEventListener("click", function(event) {
	event.preventDefault();

	showError2(emailInput, errorMessage, errorMessageEmail);

	showNumberError(phoneInput, errorMessage2, errorMessageNumber)

	if (emailInput.value.trim() !== '' && /@/.test(emailInput.value) && phoneInput.value.trim() !== '' && /^[0-9]+$/.test(phoneInput.value)) {
		nextBtnSec.disabled = true;
		setTimeout(function() {
			nextBtnSec.disabled = false;
		}, 500);
		green(emailInput, phoneInput);
		setTimeout(function() {
			slidePage.style.marginLeft = "-50%";
			bullet[current - 1].classList.add("active");
			progressCheck[current - 1].classList.add("active");
			progressText[current - 1].classList.add("active");
			current += 1;
		}, 75);
	}
});


nextBtnThird.addEventListener("click", function(event) {
	event.preventDefault();

	showError(cityInput, errorMessage, addressInput, errorMessage2);

	if (cityInput.value.trim() !== '' && addressInput.value.trim() !== '') {
		nextBtnThird.disabled = true;
		setTimeout(function() {
			nextBtnThird.disabled = false;
		}, 500);
		green(cityInput, addressInput);
		setTimeout(function() {
			slidePage.style.marginLeft = "-75%";
			bullet[current - 1].classList.add("active");
			progressCheck[current - 1].classList.add("active");
			progressText[current - 1].classList.add("active");
			current += 1;
		}, 75);
	}
});

function formSubmit(event) {
	event.preventDefault();

	showError(usernameInput, errorMessage, passwordInput, errorMessage2);

	if (usernameInput.value.trim() !== '' && passwordInput.value.trim() !== '') {
		submitBtn.disabled = true;
		setTimeout(function() {
			submitBtn.disabled = false;
		}, 500);
		green(usernameInput, passwordInput);
		setTimeout(function() {
		document.getElementById("myForm").submit();
		}, 500);
	}
}


prevBtnSec.addEventListener("click", function(event) {
	event.preventDefault();
	slidePage.style.marginLeft = "0%";
	bullet[current - 2].classList.remove("active");
	progressCheck[current - 2].classList.remove("active");
	progressText[current - 2].classList.remove("active");
	current -= 1;
});
prevBtnThird.addEventListener("click", function(event) {
	event.preventDefault();
	slidePage.style.marginLeft = "-25%";
	bullet[current - 2].classList.remove("active");
	progressCheck[current - 2].classList.remove("active");
	progressText[current - 2].classList.remove("active");
	current -= 1;
});
prevBtnFourth.addEventListener("click", function(event) {
	event.preventDefault();
	slidePage.style.marginLeft = "-50%";
	bullet[current - 2].classList.remove("active");
	progressCheck[current - 2].classList.remove("active");
	progressText[current - 2].classList.remove("active");
	current -= 1;
});



for (const input of inputElements) {
	input.addEventListener('input', function() {
		removeErrorStyle(input, errorMessage)
	});

	input.addEventListener('keydown', function(event) {
		if (event.key === 'Backspace' || input.value.trim() !== '') {
			input.style.borderColor = null;
		}
	});
}

for (const input of inputElements2) {
	input.addEventListener('input', function() {
		removeErrorStyle(input, errorMessage2)
	});

	input.addEventListener('keydown', function(event) {
		if (event.key === 'Backspace' || input.value.trim() !== '') {
			input.style.borderColor = null;
		}
	});
}

emailInput.addEventListener('input', function() {
	removeErrorStyle(emailInput, errorMessage)
	removeNumberErrorStyle(emailInput, errorMessageEmail)

	emailInput.addEventListener('keydown', function(event) {
		if (event.key === 'Backspace' || emailInput.value.trim() !== '') {
			emailInput.style.borderColor = null;
		}
	});
});

phoneInput.addEventListener('input', function() {
	removeErrorStyle(phoneInput, errorMessage2)
	removeNumberErrorStyle(phoneInput, errorMessageNumber)

	phoneInput.addEventListener('keydown', function(event) {
		if (event.key === 'Backspace' || phoneInput.value.trim() !== '') {
			phoneInput.style.borderColor = null;
		}
	});
});




