/**
 * 
 */

const deleteBtns = document.getElementsByClassName("delete-btn");
const updateBtns = document.getElementsByClassName("update-btn");
const parentCont = document.getElementById("container");
const registrationForm = document.getElementById("registration-form");


for(let i = 0; i < deleteBtns.length; i++){
	deleteBtns[i].addEventListener('click', deleteBtn);
	updateBtns[i].addEventListener('click', updateBtn);
}

function deleteBtn(e){
	const recordId = e.target.id;
	console.log("delete", recordId);
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "ex14.jsp", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            location.reload();
        }
    };
    xhr.send("recordToDelete=" + recordId);
}

const createUpdateFormNode = (studentJson = {firstName: "John", lastName: "chapo", age:21, id: 222}) => {
    const div = document.createElement('div');
    div.className = 'updateForm-form-container';
	div.id = 'updateForm-container';
	
    const h2 = document.createElement('h2');
    h2.textContent = 'Update Student #' + studentJson.id;

    const form = document.createElement('form');
    form.action = 'ex14.jsp/update-student';
    form.method = 'post';

    const hiddenInput = document.createElement('input');
    hiddenInput.type = 'hidden';
    hiddenInput.name = 'id';
    hiddenInput.value = studentJson.id; // You'll need to set this dynamically later

    const firstNameLabel = document.createElement('label');
    firstNameLabel.for = 'firstName';
    firstNameLabel.textContent = 'First Name:';

    const firstNameInput = document.createElement('input');
    firstNameInput.type = 'text';
    firstNameInput.id = 'firstName';
    firstNameInput.name = 'firstName';
	firstNameInput.value = studentJson.firstName;
    firstNameInput.required = '';

    const lastNameLabel = document.createElement('label');
    lastNameLabel.for = 'lastName';
    lastNameLabel.textContent = 'Last Name:';

    const lastNameInput = document.createElement('input');
    lastNameInput.type = 'text';
    lastNameInput.id = 'lastName';
    lastNameInput.name = 'lastName';
	lastNameInput.value = studentJson.lastName;
    lastNameInput.required = '';

    const ageLabel = document.createElement('label');
    ageLabel.for = 'age';
    ageLabel.textContent = 'Age:';

    const ageInput = document.createElement('input');
    ageInput.type = 'number';
    ageInput.id = 'age';
    ageInput.name = 'age';
    ageInput.required = '';
	ageInput.value = parseInt(studentJson.age);
    ageInput.min = '18';
    ageInput.max = '100';

    const submitButton = document.createElement('input');
    submitButton.type = 'submit';
    submitButton.value = 'Update Student';
	
	const backButton = document.createElement('button');
	backButton.textContent = 'Go to registration form';
	backButton.classList.add("regForm-btn");
	backButton.addEventListener("click", backToRegForm);

    form.appendChild(hiddenInput);
    form.appendChild(firstNameLabel);
    form.appendChild(firstNameInput);
    form.appendChild(lastNameLabel);
    form.appendChild(lastNameInput);
    form.appendChild(ageLabel);
    form.appendChild(ageInput);
    form.appendChild(submitButton);
    div.appendChild(h2);
    div.appendChild(form);
	div.appendChild(backButton);


    return div;
};

function formatStringToJson(string){
	const stringArr = string.split(",");
	
	const newJson = {
		id: stringArr[0],
		firstName: stringArr[1],
		lastName: stringArr[2],
		age: stringArr[3],
	}
	
	return newJson;
}


function updateBtn(e){
	const studentString = e.target.dataset.student;
	const studentJson = formatStringToJson(studentString);
	const updateForm = createUpdateFormNode(studentJson);
	
	if(document.getElementsByClassName("updateForm-form-container").length < 1){
		registrationForm.remove();
		parentCont.prepend(updateForm);
	} else {
		document.getElementsByClassName("updateForm-form-container")[0].remove();
		parentCont.prepend(updateForm);
		
	}
	


}

function backToRegForm(e){
	const updateForm = document.getElementById("updateForm-container");
	updateForm.remove();
	
	parentCont.prepend(registrationForm);
}
