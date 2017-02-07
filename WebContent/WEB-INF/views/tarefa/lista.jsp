<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <link href="css/tarefa.css" rel="stylesheet" />
     <link href="css/jquery-ui.css" rel="stylesheet">
            <script src="js/jquery.js"></script>
    <script src="js/jquery-ui.js"></script>
</head>
<body>
 
    
  <script type="text/javascript">
    function finalizaAgora(id) {
      $.post("finalizaTarefa", {'id' : id}, function(resposta) {
        // selecionando o elemento html atrav�s da 
        // ID e alterando o HTML dele 
        $("#tarefa_"+id).html(resposta);
      });
    }
  </script>
<a href="novaTarefa">Criar nova tarefa</a> 
<br /> <br />
<a href="logout">Sair do Sistema</a> <br /> <br />
<table>
<tr>
<th>Id</th>
<th>Descricao</th>
<th>Finalizado?</th>
<th>Data de Finalizacao </th>
</tr>
<c:forEach items="${tarefas}" var="tarefa">
<tr id="tarefa_${tarefa.id}">
<td>${tarefa.id}</td>
<td>${tarefa.descricao}</td>
<c:if test="${tarefa.finalizado eq false}">
<td>
<a href="#" onClick="finalizaAgora(${tarefa.id})">    Finalizar! </a> </td>
</c:if>
<c:if test="${tarefa.finalizado eq true}">
<td id="tarefa_${tarefa.id}">
Finalizado
</td>   
</c:if>

<td>
<fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy"/>
</td>
<td><a href="removeTarefa?id=${tarefa.id}">Remover</a></td>
<td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a> </td>
</tr>
</c:forEach>
</table>
</body>
</html>