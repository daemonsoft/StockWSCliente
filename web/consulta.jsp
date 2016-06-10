<%-- 
    Document   : consulta
    Created on : 1/06/2016, 11:27:06 AM
    Author     : daemonsoft
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producto Web Service</title>
    </head>
    <body>
        <div class="container red-text text-lighten-1">
            <div class="row">
                <div class="col s12">
                    <ul class="tabs">
                        <li class="tab col s3"><a class="${tab1}" href="#t1">Buscar</a></li>
                        <li class="tab col s3"><a class="${tab2}" href="#t2">Listar Productos</a></li>
                        <li class="tab col s3"><a class="${tab3}" href="#t3">Ingresar</a></li>
                        <li class="tab col s3"><a class="${tab4}" href="#t4">Eliminar</a></li>
                        <li class="tab col s3"><a class="${tab5}" href="#t5">Actualizar</a></li>
                    </ul>
                </div>
                <div id="t1" class="col s12">
                    <h3 class="center-align">Buscar producto</h3>
                    <h4 class="center-align">${msg1}</h4>
                    <form action="./ConsultaServlet" method="POST">
                        <table>
                            <tr>
                                <th>Codigo:</th>
                                <td><input type="text" name="codigo" required/></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input class="waves-effect red lighten-1 right waves-light btn" type="submit" name = "buscar" value="Buscar"/></td>
                            </tr>
                        </table>
                        <c:if test="${cod!=null}" >
                            <div class="row">
                                <div class="col s12 offset-l2 l8">
                                    <div class="card-panel center">
                                        <table class="responsive-table">
                                            <tbody>
                                                <tr>
                                                    <td class="right-align"><b>Código:</b></td>
                                                    <td >${cod}</td>
                                                </tr>
                                                <tr>
                                                    <td class="right-align"><b>Nombre:</b></td>
                                                    <td>${nom}</td>
                                                </tr>
                                                <tr>
                                                    <td class="right-align"><b>Precio:</b></td>
                                                    <td>${pre}</td>
                                                </tr>
                                                <tr>
                                                    <td class="right-align"><b>Stock:</b></td>
                                                    <td>${sto}</td>
                                                </tr>
                                                <tr>
                                                    <td class="right-align"><b>Descripción:</b></td>
                                                    <td>${des}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </form>

                </div>
                <div id="t2" class="col s12">
                    <h3 class="center-align">Listar todos los productos</h3>
                    <h4 class="center-align">${msg2}</h4>
                    <form action="./ConsultaServlet" method="POST">
                        <table>

                            <tr>
                                <td colspan="2"><input class="waves-effect red lighten-1 right waves-light btn" type="submit" name="todos" value="Listar Todos"/></td>
                            </tr>

                        </table>
                        <c:if test="${todosP!=null}">
                            <table class="responsive-table centered highlight">
                                <thead>
                                <th>Código</th>
                                <th>Nombre</th>
                                <th>Precio</th>            
                                <th>Stock</th>
                                <th>Descripción</th>
                                </thead>
                                <tbody>
                                    <c:forEach items="${todosP}" var="c">
                                        <tr>    
                                            <td>${c.codigo}</td>
                                            <td>${c.nombre}</td>
                                            <td>${c.precio}</td>
                                            <td>${c.stock}</td>
                                            <td>${c.descripcion}</td>                            
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                    </form>

                </div>
                <div id="t3" class="col s12">
                    <h3 class="center-align">Ingresar producto</h3>
                    <h4 class="center-align">${msg3}</h4>
                    <form action="./ConsultaServlet" method="POST">

                        <table class="responsive-table">
                            <tr>
                                <th>Codigo:</th>
                                <td><input type="text" name="codigoi" required/></td>
                            </tr>
                            <tr>
                                <th>Nombre:</th>
                                <td><input type="text" name="nombre" required/></td>
                            </tr>
                            <tr>
                                <th>Precio:</th>
                                <td><input type="number"  step="any" name="precio" required/></td>
                            </tr>
                            <tr>
                                <th>Stock:</th>
                                <td><input type="number" name="stock" required/></td>
                            </tr>
                            <tr>
                                <th>Descripción:</th>
                                <td><input type="text" name="descripcion" required/></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input class="waves-effect red lighten-1 right waves-light btn" type="submit" name="ingresar" value="Ingresar"/></td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div id="t4" class="col s12">
                    <h3 class="center-align">Eliminar producto</h3>
                    <h4 class="center-align">${msg4}</h4>
                    <form action="./ConsultaServlet" method="POST">
                        <table class="responsive-table">
                            <tr>
                                <th>Codigo:</th>
                                <td><input type="text" name="codigob" required/></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input class="waves-effect red lighten-1 right waves-light btn" type="submit" name = "borrar" value="Eliminar"/></td>
                            </tr>
                        </table>
                    </form>

                </div>
                <div id="t5" class="col s12">
                    <h3 class="center-align">Actualizar producto</h3>
                    <h4 class="center-align">${msg5}</h4>
                    <form action="./ConsultaServlet" method="POST">
                        <table>
                            <tr>
                                <th>Codigo:</th>
                                <td><input type="text" name="codigoa" <c:if test="${coda==null}">required</c:if>/></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><input class="waves-effect red lighten-1 right waves-light btn" type="submit" name = "buscara" value="Buscar"/></td>
                                </tr>
                            </table>
                        <c:if test="${coda!=null}">
                            <table class="responsive-table">
                                <tr>
                                    <th>Codigo:</th>
                                    <td><input type="text" name="codigoac" readonly="readonly" value="${coda}" required/></td>
                                </tr>
                                <tr>
                                    <th>Nombre:</th>
                                    <td><input type="text" name="nombre" value="${noma}" required/></td>
                                </tr>
                                <tr>
                                    <th>Precio:</th>
                                    <td><input type="number"  step="any" min="0" value="${Double.parseDouble(prea)}" name="precio"/></td>
                                </tr>
                                <tr>
                                    <th>Stock:</th>
                                    <td><input type="number" name="stock" value="${Integer.parseInt(stoa)}" required /></td>
                                </tr>
                                <tr>
                                    <th>Descripción:</th>
                                    <td><input type="text" name="descripcion" value="${desa}" required/></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><input class="waves-effect red lighten-1 right waves-light btn" type="submit" name="actualizar" value="Actualizar"/></td>
                                </tr>
                            </table>
                        </c:if>
                    </form>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('ul.tabs').tabs();
            });
        </script>
    </body>
</html>
