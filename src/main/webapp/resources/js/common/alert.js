function alertFunction(msg, title, status) {
	Swal.fire({
		icon: status,
		title: title,
		text: msg
	});
}