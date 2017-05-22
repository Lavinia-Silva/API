var config = {
	apiKey : "AIzaSyBrWJAz6qqbhpkRbP5Au6BAYa8jnH4xn0Y",
	authDomain : "cosmetica-b295f.firebaseapp.com",
	databaseURL : "https://cosmetica-b295f.firebaseio.com",
	projectId : "cosmetica-b295f",
	storageBucket : "cosmetica-b295f.appspot.com",
	messagingSenderId : "1053982947503"
};
firebase.initializeApp(config);

// Get a reference to the database service
var database = firebase.database();

// get elements
var fileButton = document.getElementById('fileButton');
var title = document.getElementById('title');
var salvar = document.getElementById('salvar');

var downloadURL = null;
var file = null;

// Listen for file selection
fileButton.addEventListener('change', function(e) {
	// Get file
	file = e.target.files[0];

});

salvar.addEventListener('click', function(event) {

	// Create a storage ref
	var storageRef = firebase.storage().ref();

	// upload file
	var task = storageRef.child(
			'ImagemPropaganda/' + $("#title").val() + file.name).put(file);

	// Update progress bra
	task.on('state_changed', function progress(snapshot) {

	}, function error(err) {

	}, function complete() {
		downloadURL = task.snapshot.downloadURL;

		writeUserData(title, downloadURL);
		window.location = 'cadastro_publicidade.html';

	});

});

function writeUserData(title, imageUrl) {
	firebase.database().ref().push({
		picture : imageUrl,
		title : title.value
	});
}