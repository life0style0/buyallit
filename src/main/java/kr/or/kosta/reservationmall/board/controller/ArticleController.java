package kr.or.kosta.reservationmall.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import kr.or.kosta.reservationmall.board.dto.Article;
import kr.or.kosta.reservationmall.board.dto.Board;
import kr.or.kosta.reservationmall.board.service.ArticleService;
import kr.or.kosta.reservationmall.board.service.ArticleServiceImpl;
import kr.or.kosta.reservationmall.board.service.BoardService;
import kr.or.kosta.reservationmall.common.controller.Controller;
import kr.or.kosta.reservationmall.common.controller.ModelAndView;
import kr.or.kosta.reservationmall.common.factory.XMLObjectFactory;
import kr.or.kosta.reservationmall.login.service.LoginService;
import kr.or.kosta.reservationmall.login.service.LoginServiceImpl;

/**
 * 전체 공지사항 리스트 인출을 위한 컨트롤러 설정
 * 
 * @author 이혜림
 *
 */
public class ArticleController implements Controller {

   private ArticleService articleService;
   Logger logger = Logger.getLogger(Controller.class);

   @Override
   public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
         throws ServletException {

      XMLObjectFactory factory = (XMLObjectFactory) request.getServletContext().getAttribute("objectFactory");
      articleService = (ArticleService) factory.getBean(ArticleServiceImpl.class);
      String articleId = request.getParameter("articleId");
      System.out.println("articleId : "+articleId);
      String hitCount = null;
      
      //전송된 articleId가 있을 경우, (상세보기 클릭 시) 
      
      if (articleId != null) {
         PrintWriter out = null;
         try {
            articleService.increaseHitCount_hr(articleId);
            System.out.println("new hitcnt : "+articleService.read_hr(articleId).getHitCount());
            hitCount = articleService.read_hr(articleId).getHitCount();
            
            out = response.getWriter();
            out.println(hitCount);
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            out.close();
         }
         
      } else {
         //전송된 articleId 없을 경우
         response.setContentType("text/plain; charset=utf-8");

         List<Article> list = null;
         try {
            list = articleService.listAll_hr();
         } catch (Exception e) {
            e.printStackTrace();
         }
         PrintWriter out = null;
         String result = "";
         for (Article article : list) {
            result += "   <tr class='tr_visible'>" + 
         "         <td scope='row'>" + article.getId() + "</td>\r\n"   + 
         "       <td>" + article.getTitle() + "</td>\r\n" + 
         "        <td>" + article.getUserId()+ "</td>\r\n" + 
         "        <td>" + article.getDate() + "</td>\r\n" + 
         "        <td>" + article.getHitCount() + "</td>\r\n" + 
         "        <td><button name='myhide' class='btn btn-primary' type='button'>상세보기</button></td>\r\n" + 
         "   </tr>\r\n" + 
         "   <tr name='conts' id='trdisp'style='display:none;'>\r\n" + 
         "         <td scope='row' colspan='6'>" + article.getContents() + "</td>\r\n" + 
         "   </tr>";
         }
         try {
            out = response.getWriter();
            out.println(result);
         } catch (IOException e) {
            e.printStackTrace();
         } finally {
            out.close();
         }
      }
      
      return null;
   }
}