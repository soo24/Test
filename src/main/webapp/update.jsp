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

	int port = 27017;
	
	String db = "db01";
	String collection = "people";
	
	MongoClient mongoClient = new MongoClient("localhost", port);
	MongoDatabase mongoDB = mongoClient.getDatabase(db);
	MongoCollection<Document> c = mongoDB.getCollection(collection);
	
	System.out.println("update ���� ���� ! ");
	
	FindIterable<Document> doc = find(mongoClient, mongoDB, c);
	System.out.println("����� ? "  + c.count());
	//Iterator itr = doc.iterator();
	
	out.println("<table border='1' width = '200'>");
	out.print("<tr>" +
			"<td>�̸� </td> " +
			"<td>���� </td> " + 
			"<td>�޿� </td> " +
			"</tr>");
	for(Document tmp : doc) {
		System.out.println("==> findResultRow : "+ tmp + "<br/>");
		out.print("<tr>" +
				"<td> " + tmp.getString("name") + "</td> " +
				"<td> " + tmp.get("age") + "</td> " +
				"<td> " + tmp.get("salary")  + "</td> "  +
				"</tr> ");
		//out.print(tmp.getString("name") + " <br/>");
		//out.print(tmp.get("age") + " <br/>");
		//out.print(tmp.get("salary") + " <br/>");
		
		
	}
	out.println("</table> <br/>");

%>

<%!

	public FindIterable<Document> find(MongoClient mongoClient, MongoDatabase mongoDB, MongoCollection<Document> collection) {
		
		FindIterable<Document> doc = collection.find();
		return doc;
		
	}


%>

<body>
	<h1> ������Ʈ ��ų ����� �̸��� �Է��ϼ���. add add </h1>
	<form action="update_ok.jsp" method ="post">
		
		name <input type="text" name="name"/><br/>
		
		<h3> ������ ���̿� �޿��� �Է��ϼ���. </h3>
		age <input type="text" name="age"/><br/>
		salary <input type="text" name="salary"/><br/><br/>
		<input type="submit" value="������Ʈ"/>
	</form>
</body>
</html>