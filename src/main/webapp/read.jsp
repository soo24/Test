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
	
	/*Member m = new Member();
	
	int port = m.getPort();
	String db = m.getDB();
	String collection = m.getCollection();*/
	
	
	
	MongoClient mongoClient = new MongoClient("localhost", port);
	MongoDatabase mongoDB = mongoClient.getDatabase(db);
	MongoCollection<Document> c = mongoDB.getCollection(collection);
	
	System.out.println("read ! port " + port + " /db " + db + " / collection " + collection);
	
	FindIterable<Document> doc = find(mongoClient, mongoDB, c);
	System.out.println("c.count "  + c.count());
	//Iterator itr = doc.iterator();
	
	out.println("<table border='1' width = '200'>");
	out.print("<tr>" +
			"<td>이름 </td> " +
			"<td>나이 </td> " + 
			"<td>급여 </td> " +
			"</tr>");
	for(Document tmp : doc) {
		System.out.println("==> findResultRow : "+ tmp + "<br/>");
		out.print("<tr>" +
				"<td> " + tmp.getString("name") + "</td> " +
				"<td> " + tmp.get("age") + "</td> " +
				"<td> " + tmp.get("salary")  + "</td> "  +
				"</tr> ");
		
		
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
	<a href="main.jsp">메인 페이지로 가기</a> <br/><br/>
	<h3>read 수정</h3>
</body>
</html>
