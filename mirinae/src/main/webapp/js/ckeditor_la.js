ClassicEditor 

    .create( document.querySelector( '#content' ), {
		language: 'ko'
	}) 

    .then( editor => { 

        console.log( editor ); 

    } ) 

    .catch( error => { 

        console.error( error ); 

    } );

