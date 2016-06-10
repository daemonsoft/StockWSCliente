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
        <div class="container">
            <div class="row">
                <div class="col s12">
                    <ul class="tabs">
                        <li class="tab col s3"><a <c:if test="${tab=null}"> class="active"</c:if> href="#t1">Buscar</a></li>
                        <li class="tab col s3"><a <c:if test="${tab="lis"}"> class="active"</c:if> href="#t2">Listar Productos</a></li>
                        <li class="tab col s3"><a <c:if test="${tab="ing"}"> class="active"</c:if> href="#t3">Ingresar</a></li>
                        <li class="tab col s3"><a <c:if test="${tab="eli"}"> class="active"</c:if> href="#t4">Eliminar</a></li>
                        <li class="tab col s3"><a <c:if test="${tab='act'}"> class="active"</c:if> href="#t5">Actualizar</a></li>
                        </ul>
                    </div>
                    <div id="t1" class="col s12">
                    <%-- start web service invocation --%>
                    <%if (request.getParameter("buscar") != null) {
                            request.setAttribute("tab", null);
                            try {
                                com.udea.servicio.ProductoWebService_Service service = new com.udea.servicio.ProductoWebService_Service();
                                com.udea.servicio.ProductoWebService port = service.getProductoWebServicePort();
                                // TODO initialize WS operation arguments here
                                java.lang.String codigo = request.getParameter("codigo");
                                // TODO process result here
                                java.lang.String cod = port.buscarProducto(codigo).getCodigo();
                                java.lang.String nom = port.buscarProducto(codigo).getNombre();
                                java.lang.String des = port.buscarProducto(codigo).getDescripcion();
                                java.lang.Double pre = port.buscarProducto(codigo).getPrecio();
                                java.lang.Integer sto = port.buscarProducto(codigo).getStock();
                                request.setAttribute("cod", cod);
                                request.setAttribute("nom", nom);
                                request.setAttribute("des", des);
                                request.setAttribute("pre", pre);
                                request.setAttribute("sto", sto);
                                //out.println("<font color = 'blue'>" + "Resultado de la consulta: " + cod +"</font>");
                            } catch (Exception ex) {
                                // TODO handle custom exceptions here
                            }
                        }
                    %>
                    <%-- end web service invocation --%>
                    <h3 class="center-align">Buscar producto</h3>
                    <form action="consulta.jsp" method="POST">
                        <table>
                            <tr>
                                <th>Codigo:</th>
                                <td><input type="text" name="codigo" required/></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="submit" name = "buscar" value="Buscar"/></td>
                            </tr>
                        </table>
                        <c:if test="${cod!=null}" >                
                            Código: ${cod} <br>
                            Nombre: ${nom}<br>
                            Precio: ${pre}<br>        
                            Stock: ${sto}<br>
                            Descripción: ${des}<br>
                        </c:if>
                    </form>

                </div>
                <div id="t2" class="col s12">

                    <%-- start web service invocation --%>
                    <%if (request.getParameter("todos") != null) {
                            request.setAttribute("tab", "lis");
                            try {
                                com.udea.servicio.ProductoWebService_Service service = new com.udea.servicio.ProductoWebService_Service();
                                com.udea.servicio.ProductoWebService port = service.getProductoWebServicePort();
                                // TODO process result here
                                java.util.List<com.udea.servicio.Producto> result = port.consultarProductos();
                                request.setAttribute("todosP", result);

                            } catch (Exception ex) {
                                // TODO handle custom exceptions here
                            }
                        }
                    %>
                    <%-- end web service invocation --%>

                    <h3 class="center-align">Listar todos los productos</h3>
                    <form action="consulta.jsp" method="POST">
                        <table>

                            <tr>
                                <td colspan="2"><input type="submit" name="todos" value="Listar Todos"/></td>
                            </tr>
                        </table>
                        <table >
                            <thead>
                            <th>codigo</th>
                            <th>nombre</th>
                            <th>precio</th>            
                            <th>stock</th>
                            <th>descripcion</th>

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
                    </form>

                </div>
                <div id="t3" class="col s12">
                    <%-- start web service invocation --%>
                    <%if (request.getParameter("ingresar") != null) {
                            request.setAttribute("tab", "ing");
                            try {
                                com.udea.servicio.ProductoWebService_Service service = new com.udea.servicio.ProductoWebService_Service();
                                com.udea.servicio.ProductoWebService port = service.getProductoWebServicePort();
                                // TODO initialize WS operation arguments here
                                java.lang.String codigo = request.getParameter("codigoi");
                                java.lang.String nombre = request.getParameter("nombre");
                                double precio = Double.parseDouble(request.getParameter("precio"));
                                int stock = Integer.parseInt(request.getParameter("stock"));
                                java.lang.String descripcion = request.getParameter("descripcion");
                                // TODO process result here
                                java.lang.String result = port.ingresarProducto(codigo, nombre, precio, stock, descripcion);
                                out.println("<font color = 'blue'>" + result + "</font>");
                            } catch (Exception ex) {
                                out.println("<font color = 'red'>" + "Debe ingresar los datos correctamente" + ex + "</font>");
                            }
                        }
                    %>
                    <%-- end web service invocation --%>
                    <h3 class="center-align">Ingresar producto</h3>
                    <form action="consulta.jsp" method="POST">

                        <table>
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
                                <td colspan="2"><input type="submit" name="ingresar" value="Ingresar"/></td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div id="t4" class="col s12">

                    <%-- start web service invocation --%>
                    <%if (request.getParameter("borrar") != null) {
                            request.setAttribute("tab", "eli");
                            try {
                                com.udea.servicio.ProductoWebService_Service service = new com.udea.servicio.ProductoWebService_Service();
                                com.udea.servicio.ProductoWebService port = service.getProductoWebServicePort();
                                // TODO initialize WS operation arguments here
                                java.lang.String codigo = request.getParameter("codigob");
                                // TODO process result here
                                java.lang.String result = port.borrarProducto(codigo);
                                out.println("<font color = 'blue'>" + result + "</font>");
                            } catch (Exception ex) {
                                // TODO handle custom exceptions here
                            }
                        }%>
                    <%-- end web service invocation --%>
                    <h3 class="center-align">Eliminar producto</h3>
                    <form action="consulta.jsp" method="POST">
                        <table>
                            <tr>
                                <th>Codigo:</th>
                                <td><input type="text" name="codigob" required/></td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="submit" name = "borrar" value="Eliminar"/></td>
                            </tr>
                        </table>
                    </form>

                </div>
                <div id="t5" class="col s12">
                    <%-- start web service invocation --%>
                    <%if (request.getParameter("buscara") != null) {
                            request.setAttribute("tab", "act");
                            try {
                                com.udea.servicio.ProductoWebService_Service service = new com.udea.servicio.ProductoWebService_Service();
                                com.udea.servicio.ProductoWebService port = service.getProductoWebServicePort();
                                // TODO initialize WS operation arguments here
                                java.lang.String codigo = request.getParameter("codigoa");
                                // TODO process result here

                                java.lang.String nom = port.buscarProducto(codigo).getNombre();
                                java.lang.String des = port.buscarProducto(codigo).getDescripcion();
                                java.lang.Double pre = port.buscarProducto(codigo).getPrecio();
                                java.lang.Integer sto = port.buscarProducto(codigo).getStock();
                                out.println(nom + "  este es l cod");
                                request.setAttribute("coda", codigo);
                                request.setAttribute("noma", nom);
                                request.setAttribute("desa", des);
                                request.setAttribute("prea", pre);
                                request.setAttribute("stoa", sto);
                                // TODO process result here

                            } catch (Exception ex) {
                                // TODO handle custom exceptions here
                            }
                        } else if (request.getParameter("actualizar") != null) {
                            request.setAttribute("tab", "act");
                            try {
                                com.udea.servicio.ProductoWebService_Service service = new com.udea.servicio.ProductoWebService_Service();
                                com.udea.servicio.ProductoWebService port = service.getProductoWebServicePort();
                                java.lang.String codigo = request.getParameter("codigoac");
                                java.lang.String nombre = request.getParameter("nombre");
                                java.lang.String precio = request.getParameter("precio");
                                java.lang.String stock = request.getParameter("stock");
                                java.lang.String descripcion = request.getParameter("descripcion");

                                java.lang.String result = port.actualizarProducto(codigo, nombre, Double.parseDouble(precio), Integer.parseInt(stock), descripcion);
                                out.println(result);

                            } catch (Exception ex) {
                                // TODO handle custom exceptions here
                            }
                        }
                    %>
                    <%-- end web service invocation --%>

                    <h3 class="center-align">Actualizar producto</h3>
                    <form action="consulta.jsp" method="POST">
                        <table>
                            <tr>
                                <th>Codigo:</th>
                                <td><input type="text" name="codigoa" <c:if test="${coda==null}">required</c:if>/></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><input type="submit" name = "buscara" value="Buscar"/></td>
                                </tr>
                            </table>
                        <c:if test="${coda!=null}">
                            <table >
                                <tr>
                                    <th>Codigo:</th>
                                    <td><input type="text" name="codigoac" readonly="readonly" value="${coda}" required/></td>
                                </tr>
                                <tr>
                                    <th>Nombre:</th>
                                    <td><input type="text" name="nombre" value="${noma}" required/></td>
                                </tr>

                                <th>Precio:</th>
                                <td><input type="number"  step="any" value="${Double.parseDouble(prea)}" name="precio" required/></td>

                                <tr>
                                    <th>Stock:</th>
                                    <td><input type="number" name="stock" value="${Integer.parseInt(stoa)}" required/></td>
                                </tr>
                                <tr>
                                    <th>Descripción:</th>
                                    <td><input type="text" name="descripcion" value="${desa}" required/></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><input type="submit" name="actualizar" value="Actualizar"/></td>
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
