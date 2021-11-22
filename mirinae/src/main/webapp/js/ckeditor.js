ClassicEditor 

    .create( document.querySelector( '#textarea' ), {
		language: 'ko'
	}) 

    .then( editor => { 

        console.log( editor ); 

    } ) 

    .catch( error => { 

        console.error( error ); 

    } );

