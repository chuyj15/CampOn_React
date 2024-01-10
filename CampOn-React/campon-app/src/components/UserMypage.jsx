import React from 'react'
import { Link, useNavigate } from 'react-router-dom'

const UserMyypage = ({sets, userInfo, roles}) => {
    const logoutt = sets.logoutt;
    return (
        <>
            <div className="mypage_banner">
                <div className="mypage_banner_header"><h4>마이페이지</h4></div>
                <div className="mypage_banner_back"></div>
                <div className="mypage_banner_con">
                    <ul className="w-100 text-center">
                        {/* { (userAuth == 'ROLE_USER') && <li><img src="/img/user/test_user.png" alt="프로필이미지입니다. " /></li>}
                        { (userAuth == 'ROLE_SELL') && <li><img src="/img/user/test_sell.png" alt="프로필이미지" /></li>}
                        { (userAuth == 'ROLE_ADMIN') && <li><img src="/img/user/test_admin.png" alt="프로필이미지" /></li>} */}
                        { roles?.isUser && <li><img src="/img/user/test_user.png" alt="프로필이미지입니다. " /></li>}
                        { roles?.isSell && <li><img src="/img/user/test_sell.png" alt="프로필이미지" /></li>}
                        { roles?.isAdmin && <li><img src="/img/user/test_admin.png" alt="프로필이미지" /></li>}
                        <li>
                            <h4>아이디 : {userInfo?.userId}</h4>
                        </li>
                    </ul>
                </div>
            </div>
            {/* <div class="container">
                <div class="w-100 text-center mypage_user">
                    <ul class="d-flex justify-content-around w-100">
                        <li>
                            <Link to="/user/update">내정보 관리</Link>
                        </li>
                        <li>
                            <Link to="/api/camp/reservation">내 예약 현황</Link>
                        </li>
                        <li>
                            <Link to="/api/board/boardlist">구매 후기</Link>
                        </li>
                    </ul>
                    <ul class="d-flex justify-content-around w-100">
                        <li>
                            <Link to="/api/camp/favorites">찜한 캠핑장</Link>
                        </li>
                        <li>
                            <Link to="/product/wishlist">찜한 상품</Link>
                        </li>
                        <li>
                            <Link to="/product/cart">장바구니</Link>
                        </li>
                    </ul>
                </div>
            </div> */}
            <div className="container">
                {
                    ( roles?.isUser && 
                    <div className="w-100 text-center mypage_user">
                        <ul className="d-flex justify-content-around w-100">
                            <li>
                                <Link to="/user/update">내정보 관리</Link>
                            </li>
                            <li>
                                <Link to="/api/camp/reservation">내 예약 현황</Link>
                            </li>
                            <li>
                                <Link to="/api/board/boardlist">구매 후기</Link>
                            </li>
                        </ul>
                        <ul className="d-flex justify-content-around w-100">
                            <li>
                                <Link to="/api/camp/favorites">찜한 캠핑장</Link>
                            </li>
                            <li>
                                <Link to="/product/wishlist">찜한 상품</Link>
                            </li>
                            <li>
                                <Link to="/product/cart">장바구니</Link>
                            </li>
                        </ul>
                    </div>
                    )
                }
                {
                    (roles?.isSell && 
                    <div className="w-100 text-center mypage_sell">
                        <ul className="d-flex justify-content-around w-100">
                            <li>
                                <Link to="/user/update">내정보 관리</Link>
                            </li>
                            <li>
                                <Link to="/admin/adlistseller">광고 신청 목록</Link>
                            </li>
                            <li>
                                <Link to="/admin/campproductlist">캠핑장 관리</Link>
                            </li>
                            <li>
                                <Link to="/api/board/boardlist">내 캠핑장 후기</Link>
                            </li>
                        </ul>
                    </div>
                    )
                }
                {
                    (roles?.isAdmin && 
                    <div className="w-100 text-center mypage_admin">
                        <ul className="d-flex justify-content-around w-100">
                            <li>
                                <Link to="/admin/memberList">회원 관리</Link>
                            </li>
                            <li>
                                <Link to="/admin/campproductlist">캠핑장 관리</Link>
                            </li>
                            <li>
                                <Link to="/admin/adlist">광고 관리</Link>
                            </li>
                            <li>
                                <Link to="/api/board/boardlist">후기 관리</Link>
                            </li>
                        </ul>
                        <ul className="d-flex justify-content-around w-100">
                            <li>
                                <Link to="/admin/productlist">스토어상품 관리</Link>
                            </li>
                        </ul>
                    </div>
                    )
                }





            </div>
            {/* <form action="/logout" method="post"> */}
            <button type="button" onClick={logoutt} className="btn btn-warning btn-lg w-100 mypage_logout_btn">로그아웃</button>
            {/* </form> */}
        </>
    )
}

export default UserMyypage