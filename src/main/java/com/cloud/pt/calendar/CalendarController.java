
  package com.cloud.pt.calendar;
  
  import java.sql.Date; import java.util.List;
  
  import javax.servlet.http.HttpSession;
  
  import org.springframework.beans.factory.annotation.Autowired; import
  org.springframework.stereotype.Controller; import
  org.springframework.web.bind.annotation.GetMapping; import
  org.springframework.web.bind.annotation.PostMapping; import
  org.springframework.web.bind.annotation.RequestMapping; import
  org.springframework.web.bind.annotation.ResponseBody;
  
  import com.cloud.pt.ptClass.PtClassService; import
  com.cloud.pt.ptClass.PtClassVO;
  
  import lombok.Getter; import lombok.Setter;
  
  @RequestMapping("/ptClass/*")
  
  @Controller public class CalendarController {
  
  @Autowired private PtClassService ptClassService;
  
  @GetMapping("ptList") 
  public void getCalendar() throws Exception{
  
  }
  
  @PostMapping("ptList")
  
  @ResponseBody public List<PtClassVO> getCalendar(HttpSession
  session,PtClassVO ptClassVO ) throws Exception{ List<PtClassVO> ar =
  ptClassService.ptClassList(session);
  
  return ar; }
  
  }
  
 