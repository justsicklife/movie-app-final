function submitForm(action) {
	let form = document.getElementById('form-submit');
	form.action = action;
	form.submit();
}