function submitForm(action) {
	let form = document.getElementById('form-submit');
	save();
	form.action = action;
	form.submit();
}