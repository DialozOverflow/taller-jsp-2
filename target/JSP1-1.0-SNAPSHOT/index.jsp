<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function añadir() {
                let tb = document.querySelector('.tt');
                let children = tb.childNodes;
                let cont_children = 0;
                for (let x = 0; x < children.length; x++) {
                    if (children[x].localName == 'tr') {
                        cont_children += 1;
                    }
                }
                if (cont_children <= 60) {
                    let nom = document.querySelector('.nom');
                    let num = document.querySelector('.num');
                    if (nom.value !== '' && num.value !== '') {
                        let tt = document.querySelector('.tt');
                        let tr = document.createElement('tr');
                        let tdn = document.createElement('td');
                        tdn.setAttribute('class', 'i0');
                        let tin = document.createElement('input');
                        tin.value = nom.value;
                        tdn.appendChild(tin);
                        tr.appendChild(tdn);
                        tin.setAttribute('readonly', 'true');
                        for (let y = 0; y < 11; y++) {
                            let td = document.createElement('td');
                            td.setAttribute('class', 'i' + (y + 1));
                            let inp = document.createElement('input');
                            inp.setAttribute('type', 'number');
                            inp.setAttribute('readonly', 'true');
                            inp.value = '0';
                            td.appendChild(inp);
                            tr.appendChild(td);
                            if (y === 10){
                                inp.value = num.value;
                            }
                        }
                        let tde = document.createElement('td');
                        let edit = document.createElement('input');
                        edit.setAttribute('type', 'button');
                        edit.onclick = function () {
                            if (edit.value === 'Editar'){
                                edit.value = 'Guardar';
                                for (let x = 0; x < 12; x++) {
                                    let hijo = tr.querySelector('.i'+x+' input');
                                    hijo.removeAttribute('readonly');
                                }
                            }else{
                                edit.value = 'Editar';
                                let cont = 0;
                                for (let x = 0; x < 12; x++) {
                                    let hijo = tr.querySelector('.i'+x+' input');
                                    hijo.setAttribute('readonly', 'true');
                                    if (x > 0 && x < 11){
                                        cont += parseInt(hijo.value);
                                    }
                                    if (x === 11){
                                        hijo.value -= cont;
                                    }
                                }
                            }
                        }
                        edit.value = 'Editar';
                        tde.appendChild(edit);
                        tr.appendChild(tde);
                        let tdel = document.createElement('td');
                        let del = document.createElement('input');
                        del.setAttribute('type', 'button');
                        del.onclick = function () {
                            tr.remove();
                        }
                        del.value = 'Eliminar';
                        tdel.appendChild(del);
                        tr.appendChild(tdel);
                        tt.appendChild(tr);
                    } else {
                        alert('Hay casillas sin llenar');
                    }
                }else{
                    alert('Se alcanzo el limite de 60 usuarios');
                }
            }
        </script>
    </head>

    <body>
        <h1>Excusas para el trabajo</h1>
        <br><br>
        <div class="add">
            <h2>Añadir usuario</h2>
            <br>
            <p>Ingresar nombre del trabajador</p>
            <input type="text" class="nom">
            <br>
            <p>Ingrese el numero horas a trabajar</p>
            <input type="number" class="num">
            <br>
            <button onclick="añadir()">Añadir</button>
            <br><br>
        </div>
        <table>
            <tbody class="tt">
                <tr>
                    <th>Nombre</th>
                    <th>Enfermedad</th>
                    <th>Calamidad domestica</th>
                    <th>Permiso personal</th>
                    <th>Permiso sindical</th>
                    <th>Cita medica</th>
                    <th>Problema en la via</th>
                    <th>Desastre natural</th>
                    <th>Urto o robo</th>
                    <th>Jurado de votacion</th>
                    <th>Sin justificar</th>
                    <th>Cantidad de horas</th>
                    <th>Editar</th>
                    <th>Eliminar</th>
                </tr>
            </tbody>
        </table>
    </body>
    <style>
        * {
            margin: 0;
            box-sizing: border-box;
        }

        body {
            width: 100vh;
            height: 200h;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        tbody {
            width: 100%;
        }

        tr {
            width: 100%;
        }

        tr:nth-child(even) {
            background: #bbbbff;
        }

        td,
        th {
            border: 1px solid #000;
        }

        th {
            background: #0000ff;
            color: white;
        }
        td input{
            width: 100px;
        }
    </style>

    </html>