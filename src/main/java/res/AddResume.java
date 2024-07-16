package res;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;


@MultipartConfig
/**
 * Servlet implementation class AddResume
 */
public class AddResume extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddResume() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	    
	    System.out.println("In do post method of ADD Resume servlet.");
	    Part file=request.getPart("resume");
	    
	   String resumeFileName=file.getSubmittedFileName();
	   System.out.println("Selected Resume File Name: "+resumeFileName);
	   
	   String uploadedpath = "C:\\Users\\Rushil\\eclipse-workspace\\job\\src\\main\\webapp\\image" + resumeFileName;
       System.out.print("Uploaded Path :" + uploadedpath);
       
       try {
           
           FileOutputStream fos = new FileOutputStream(uploadedpath);
           InputStream is = file.getInputStream();
           
           byte[] data = new byte[is.available()];
           is.read(data);
           fos.write(data);
           fos.close();
           }
           catch(Exception e) {
               e.printStackTrace();
           }
	    
	    //add resume in database
       try {
           
           
           
       }
       catch(Exception e){
           e.printStackTrace();
       }
	}

}
