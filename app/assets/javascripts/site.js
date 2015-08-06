//jQuery is required to run this code
$( document ).ready(function(){
 function fetchUserInfo(event){
	event.preventDefault();
	
	var userID = $(event.target).data('id')
	var request = $.get('/show/users/' + userID);

	function handleModal(response) { 
	$('.modal').modal(); 
	$('.modal-title').text([response.first_name + " " +response.last_name]); 
	$('.modal-age').text("Age: " + response.age) 
	$('.height').text("Height: " + response.information.height + " ft") 
	$('.weight').text("Weight: " + response.information.weight + " lbs")
	$('.education').text(response.information.education)
	$('.goals').text(response.information.goals)
	$('.strengths').text(response.information.strengths)
	$('.weaknesses').text(response.information.weaknesses)
	$('.activity').text(response.information.activities)
	$('.memberships').text(response.information.memberships)
	$('.equipment').text(response.information.equipment)
	$('.photo').attr('src', (response.user_image_url))
	$('.followers').text("Followers: " + response.count_followers)
	$('.follow').html('<button class="btn btn-success btn-xs follow-button">'
	+ "Follow Me!" + '</button>') 
	$('.follow-button').on('click', function(){ var userID = $(event.target).data('id')
	var follow_request = $.get(' /finder/'+ userID +'/follow'); }) }

		function handleError (err1, err2, err3) {
    		console.error('OH NO!!', err1, err2, err3);
  		}

 		request.done(handleModal);
 		request.fail(handleError);
}
$('.user').on('click', fetchUserInfo);  
  
});