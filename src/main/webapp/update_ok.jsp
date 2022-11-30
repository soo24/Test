<%@page import="com.mongodb.client.model.Updates"%>
<%@page import="com.mongodb.client.model.Filters"%>
<%@page import="org.bson.conversions.Bson"%>
<%@page import="com.mongodb.client.FindIterable"%>
<%@page import="java.util.*"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.MongoClient"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<%
	request.setCharacterEncoding("EUC-KR");

	int port = 27017;
	
	String db = "db01";
	String collection = "people";
	
	MongoClient mongoClient = new MongoClient("localhost", port);
	MongoDatabase mongoDB = mongoClient.getDatabase(db);
	MongoCollection<Document> c = mongoDB.getCollection(collection);
	
	System.out.println("update_ok ���� ���� ! ");
	
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String salary = request.getParameter("salary");
	
	update(mongoClient, mongoDB, c, name, age, salary);

%>

<%!

	public void update(MongoClient mongoClient, MongoDatabase mongoDB, MongoCollection<Document> collection,
				String name, int age, String salary) {
		
		collection.updateOne(Filters.eq("name", name), Updates.set("age", age));
		if(salary != null && !salary.equals("")) {
			collection.updateOne(Filters.eq("name", name), Updates.set("salary", salary));
		}
		System.out.println("==> Update " + name + "'s age ");
	
	}


%>

<body>
	<a href="main.jsp">������Ʈ �Ϸ�Ϸ�Ϸ�</a>
	<a href="main.jsp">���� �������� ����</a> <br/><br/>
	<a href="read.jsp">��ü ��� ����</a>
	<h3>update sulin-1 branch�� ������</h3>
</body>
</html>