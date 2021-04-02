<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "l_books.L_BooksDAO" %>
<%@ page import = "l_books.L_BooksDTO" %>
<%@ page import = "java.io.PrintWriter" %>    
<%@page import="java.io.File"%>

<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
	int bookNo = Integer.parseInt(request.getParameter("no"));

    // 파일이 저장되는 경로
    String path = request.getSession().getServletContext().getRealPath("book-img");

    int size = 1024 * 1024 * 10; // 저장가능한 파일 크기 10mb로제한
    String file = ""; // 업로드 한 파일의 이름(이름이 변경될수 있다)
    String originalFile = ""; // 이름이 변경되기 전 실제 파일 이름

    // 실제로 파일 업로드하는 과정
    try{
        MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8"); //, new DefaultFileRenamePolicy() 파일이름중복방지옵션

        Enumeration<?> files = multi.getFileNames();
        String str = (String)files.nextElement(); // 파일 이름을 받아와 string으로 저장
		//String str = Integer.toString(bookNo);
        file = multi.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
        originalFile = multi.getOriginalFileName(str); // 원래의 파일이름 가져옴
	
        String fullPath = path+"/"+originalFile;
        String newPath = path+"/"+bookNo+".jpg";
        
        File newFileObj = new File(newPath);
        if( newFileObj.exists() ){
        	if(newFileObj.delete()){ 
        		System.out.println("파일삭제 성공"); 
        	}
        	else{ 
        		System.out.println("파일삭제 실패");
        	} 
        }
        else{ 
        	System.out.println("파일이 존재하지 않습니다."); 
        } 
        
        File fileObj = new File(fullPath);
        fileObj.renameTo(new File(newPath));    
        
    } catch (Exception e) {
        e.printStackTrace();
    }
    /*
    PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이미지 업로드 완료');");
	script.println("location.href='?sec=book-edit&no="+bookNo+"'");
	script.println("</script>");
	script.close();
	*/
%>
	<script>
	alert('이미지 업로드 완료');
	location.href="/BOOKFLEA/admin.jsp?sec=book-edit&no=<%=bookNo%>";
	</script>
</body>
</html>