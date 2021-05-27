<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="unit" class="com.iwonsoft.unit.PageUtil" scope="page" />
<c:set var="ajaxUrl" value="${fn:replace(requestScope['javax.servlet.forward.servlet_path'], 'index', 'ajax')}" />


    <div id="container">
        <section>
            <div class="section_inner">
                <div class="breadcrumb">
                    <span>홈</span>
                    <span>주문내역</span>
                    <span>장바구니</span>
                    <span>결제완료</span>
                </div>
            </div>     
        </section>
       
        <section>
            <div class="section_inner">
                <div class="cart_complete">
                    <strong class="cart_complete_title">주문/ 결제가 정상적으로, 완료되었습니다.</strong>
                    <table class="card_complete_table">
                        <tr>
                            <th>주문번호</th>
                            <td>223p0482u34-328</td>
                        </tr>
                        <tr>
                            <th>주문상품</th>
                            <td>[VOD] 100만부 판매 베스트 셀러 저자 1</td>
                        </tr>
                        <tr>
                            <th>총 결제 금액</th>
                            <td>
                                <span class="pay">90,000</span>원
                            </td>
                        </tr>
                        <tr>
                            <th>결제수단</th>
                            <td>
                                <div class="method">
                                    <div>무통장 입금(가상계좌)</div>
                                    <div class="color_main">김지원 / 신한 / 208964561263</div>
                                    <div class="color_main">입금기한 : 2020-12-31 까지</div>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <div class="card_complete_button_area">
                      <button type="button" class="card_complete_button btn_white" onclick="location.href='/front/mypage/payment' ">구매내역 보기</button>
                      <button type="button" class="card_complete_button btn_cyan" onclick="location.href='/front/main/index' ">홈으로 가기</button>
                    </div>
                </div>
            </div>
        </section>

        
    </div><!-- // #container -->


