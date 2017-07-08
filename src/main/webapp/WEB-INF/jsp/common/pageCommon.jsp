<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<ul class="pagination">
	<c:choose>
		<c:when test="${pageNum == 1}">
			<!-- 第一页的话，就不能向上翻页了 -->
			<li class="disabled" ><a  id="lastPage" href="">&laquo;</a></li>
		</c:when>
		<c:otherwise>
			<li><a id="lastPage" href="">&laquo;</a></li>
		</c:otherwise>
	</c:choose>
	
	<c:forEach varStatus="i" begin="1" end="${totalPage}">
     			
     			<c:choose>
     				<c:when test="${i == pageNum}">
     					<!-- 当前页的话，不能再点击 -->
     					<li class="disabled"><a class="pageLink" index="${i}" href="">${i}</a></li>
     				</c:when>
     				<c:otherwise>
     					<li ><a class="pageLink" index="${i}" href="">${i}</a></li>
     				</c:otherwise>
     			</c:choose>
     		</c:forEach>
     	<c:choose>
	  		<c:when test="${pageNum == totalPage}">
				<!-- 最后的话，就不能向下翻页了 -->
				<li  class="disabled"><a  id="nextPage" href="">&raquo;</a></li>
			</c:when>
			<c:otherwise>
				<li><a id="nextPage" href="">&raquo;</a></li>
			</c:otherwise>
		</c:choose>
</ul>