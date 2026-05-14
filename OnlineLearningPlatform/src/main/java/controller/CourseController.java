package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import org.springframework.ui.Model;
import model.Course;
import dao.CourseDAO;
import dao.EnrollmentDAO;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import dao.UserDAO;
import model.User;

@Controller
public class CourseController {

	@RequestMapping("/")
	public String homePage() {

	    return "index";

	}
	
	@RequestMapping("/courses")
	public String showCourses(Model model,
	                          HttpSession session) {

	    if(session.getAttribute("user") == null) {

	        return "redirect:/login";
	    }

	    CourseDAO dao = new CourseDAO();

	    List<Course> courseList = dao.getAllCourses();

	    model.addAttribute("courses", courseList);

	    return "courses";
	}
    
    @RequestMapping("/myCourses")
    public String showMyCourses(HttpSession session) {

        if(session.getAttribute("user") == null) {
            return "redirect:/login";
        }

        return "myCourses";
    }
    
    @RequestMapping("/login")
    public String showLoginPage() {
        return "login";
    }
    
    @RequestMapping("/signup")
    public String showSignupPage() {
        return "signup";
    }
    
    @RequestMapping("/progress")
    public String showProgressPage(HttpSession session) {

        if(session.getAttribute("user") == null) {
            return "redirect:/login";
        }

        return "progress";
    }
    
    @RequestMapping("/certificate")
    public String showCertificate(
            @RequestParam("courseName") String courseName,
            HttpSession session,
            Model model
    ) {

        if(session.getAttribute("user") == null) {

            return "redirect:/login";
        }


        String completedCourse =
            (String) session.getAttribute("completedCourse");


        // Block certificate if video not completed
        if(completedCourse == null ||
           !completedCourse.equals(courseName)) {

            return "redirect:/courses";
        }


        String username =
            (String) session.getAttribute("username");

        model.addAttribute("username", username);

        model.addAttribute("courseName", courseName);

        return "certificate";
    }
    
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/home";
    }
    
    @PostMapping("/registerUser")
    public String registerUser(
            @RequestParam("fullname") String fullname,
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            Model model
    ) {

        User user = new User();

        user.setFullname(fullname);
        user.setEmail(email);
        user.setPassword(password);

        UserDAO dao = new UserDAO();

        boolean status = dao.registerUser(user);


        // Signup Success
        if(status) {

            return "redirect:/login";
        }


        // Email Already Exists
        model.addAttribute("error",
                "User already exists with this email");

        return "signup";
    }
    
    @PostMapping("/loginUser")
    public String loginUser(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            HttpSession session,
            Model model
    ) {

        UserDAO dao = new UserDAO();

        boolean status = dao.loginUser(email, password);

        if(status) {

            dao.saveLoginHistory(email);

            String fullname =
                dao.getFullNameByEmail(email);

            session.setAttribute("user", email);

            session.setAttribute("username", fullname);

            return "redirect:/courses";
        }

        model.addAttribute("error",
                "Incorrect Email or Password");

        return "login";
    }
    
    @RequestMapping("/enroll")
    public String enrollCourse(
            @RequestParam("id") int id,
            HttpSession session,
            Model model
    ) {

        if(session.getAttribute("user") == null) {

            return "redirect:/login";
        }

        String email =
            (String) session.getAttribute("user");

        CourseDAO courseDao = new CourseDAO();

        Course course =
            courseDao.getCourseById(id);

        EnrollmentDAO enrollmentDao =
            new EnrollmentDAO();

        enrollmentDao.enrollCourse(
                email,
                course.getId(),
                course.getTitle()
        );

        model.addAttribute("course", course);

        return "video";
    }
    
    @RequestMapping("/completeCourse")
    public String completeCourse(
            @RequestParam("courseName") String courseName,
            HttpSession session,
            Model model
    ) {

        session.setAttribute("completedCourse", courseName);

        model.addAttribute("courseName", courseName);

        return "courseCompleted";
    }
    
    @RequestMapping("/completeVideo")
    public String completeVideo(
            @RequestParam("courseName") String courseName,
            HttpSession session
    ) {

        session.setAttribute(
                "completedCourse",
                courseName
        );

        return "redirect:/certificate?courseName="
                + courseName;
    }
}