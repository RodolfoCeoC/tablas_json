
addEventListener('DOMContentLoaded', () =>{  //Creamos variables que vamos a utilizar, estas contienen clases and id's que están en el html
    const form_login = document.querySelector('#form_login')
    const login_span = form_login.querySelector('.titulo_boton')
    const loader = form_login.querySelector('#loader')
    const mensaje_error = document.querySelector('.contenedor_error')

    if (form_login) {  //Vamos a utilizar condicionales para evaluar las entradas de usuario y contraseña
        form_login.addEventListener('submit', event =>{
            event.preventDefault()

            const usuario = form_login.querySelector('.usuario').value
            const contrasenia = form_login.querySelector('.contrasenia').value

            login_span.style.display = 'none'
            loader.style.display = 'inline'


            setTimeout(() => { //Asignamos los datos que serán evaluados
                if (usuario == 'Rodolfo123' && contrasenia == '12345'){ //Si el nombre es de un alumno, nos dará la bienvenida como alumno
                    location.href = "jsonpruebas.html";
                    login_span.style.display = 'inline'
                    loader.style.display = 'none'
                   //si estos llegan a ser correctos, nos mostrará un msj en pantalla indicando un ingreso exitoso

                }else if(usuario == 'Santillan' && contrasenia == '12345'){
                    location.href = "jsonpruebas.html";//Si el nombre es de un profesor, nos dará la bienvenida como profesor
                    login_span.style.display = 'inline'
                    loader.style.display = 'none'
                
                }else{
                    mensaje_error.classList.add('mostrar_error') //Mostrará un error indicando una falla en la entrada de datos
                    login_span.style.display = 'inline'
                    loader.style.display = 'none'

                    setTimeout(() => {
                        mensaje_error.classList.remove('mostrar_error')
                    }, 5000);  //Asignaremos el tiempo que se mostrará la ventana de error
                }
                
                
            },2500)
            

    })

   }


})