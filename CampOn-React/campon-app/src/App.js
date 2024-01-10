import 'bootstrap/dist/css/bootstrap.min.css';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import './App.css';
// 메인페이지
import Index from './pages/Index';
// 상태 관리 
import { CategoryProvider } from './apis/CategoryContext';
import { category } from './apis/product';
// 관리자
import AdminProductAddCon from './containers/admin/AdminProductAddCon';
import AdminProductList from './containers/admin/AdminProductList';
import AdminMemberListCon from './containers/admin/AdminMemberListCon';
import AdminProductUpdCon from './containers/admin/AdminProductUpdCon';
import AdminCampListCon from './containers/admin/AdminCampListCon';
import AdminCampAddCon from './containers/admin/AdminCampAddCon';
import AdminCampUpdCon from './containers/admin/AdminCampUpdCon';
import AdminCampDAddCon from './containers/admin/AdminCampDAddCon';
import AdminDCampUpdCon from './containers/admin/AdminDCampUpdCon';
import AdminAdApplyCon from './containers/admin/AdminAdApplyCon';
import AdminAdListCon from './containers/admin/AdminAdListCon';
import AdminSAdListCon from './containers/admin/AdminSAdListCon';
// 유저
import UserJoinCon from './containers/user/UserJoinCon';
import UserLoginCon from './containers/user/UserLoginCon';
import UserMypageCon from './containers/user/UserMypageCon';
import UserUpdateCon from './containers/user/UserUpdateCon';
// 게시판
import CampBoardMainCon from './containers/board/CampBoardMainCon';
import CampBoardReadCon from './containers/board/CampBoardReadCon';
import ProductBoardReadCon from './containers/board/ProductBoardReadCon';
import CampBoardInsertCon from './containers/board/CampBoardInsertCon';
import ProductBoardInsertCon from './containers/board/ProductBoardInsertCon';
import CampBoardUpdateCon from './containers/board/CampBoardUpdateCon'
import ProductBoardUpdateCon from './containers/board/ProductBoardUpdateCon'
import CampBoardListCon from './containers/board/CampBoardListCon'
// 캠프
import CampMain from './containers/camp/CampMain';
import CampProduct from './containers/camp/CampProduct';
import CampProducts from './containers/camp/CampProducts';
import Favorites from './containers/camp/Favorites';
import CampDetail from './containers/camp/CampDetail';
import Reservate from './containers/camp/Reservate';
import Complete from './containers/camp/Complete';
import Reservation from './containers/camp/Reservation';
import Schedule from './containers/camp/Schedule';
// 상품
import ProductIndexContainer from './containers/product/ProductIndexContainer';
import ProductListContainer from './containers/product/ProductListContainer';
import ProductDetailContainer from './containers/product/ProductDetailContainer';
import ProductCartContainer from './containers/product/ProductCartContainer';
import ProductWishListContainer from './containers/product/ProductWishListContainer';
import ProductPaymentContainer from './containers/product/ProductPaymentContainer';
import ProductDepositCompContainer from './containers/product/ProductDepositCompContainer';
import NotFound from './containers/error/NotFound';
import ServerError from './containers/error/ServerError';
import Test from './containers/error/Test';


function App() {
  return (
    <BrowserRouter>
      <CategoryProvider>
        <Routes>
          {/* 캠프온 메인 (추후 캠프 index랑 연결) */}
          <Route path="/" element={<Index />} />
          {/* 상품 */}
          <Route path="/product" element={<ProductIndexContainer />} />
          <Route path="/product/productList" element={<ProductListContainer />} />
          <Route path="/product/productDetaile" element={<ProductDetailContainer />} />
          <Route path="/product/cart" element={<ProductCartContainer />} />
          <Route path="/product/wishlist" element={<ProductWishListContainer />} />
          <Route path="/product/payment" element={<ProductPaymentContainer />} />
          <Route path="/product/complete/:orderNumber" element={<ProductDepositCompContainer />} />
          {/* 캠핑 */}
          <Route path="/api/camp/index" element={<CampMain />} />
          <Route path="/api/camp/campproducts/" element={<CampProducts />} />
          <Route path="/api/camp/campproduct/:no" element={<CampProduct />} />
          <Route path="/api/camp/campdetail/:no" element={<CampDetail />} />
          <Route path="/api/camp/favorites" element={<Favorites />} />
          <Route path="/api/camp/reservate/:no" element={<Reservate />} />
          <Route path="/api/camp/complete" element={<Complete />} />
          <Route path="/api/camp/reservation" element={<Reservation />} />
          <Route path="/api/camp/schedule" element={<Schedule />} />
          {/* 유저 */}
          <Route path="/user/login" element={<UserLoginCon />} />
          <Route path="/user/join" element={<UserJoinCon />} />
          <Route path="/user/update" element={<UserUpdateCon />} />
          <Route path="/user/mypage" element={<UserMypageCon />} />

          {/* 관리자 */}
          <Route path="/admin/productlist" element={<AdminProductList />} />
          <Route path="/admin/productadd" element={<AdminProductAddCon />} />
          <Route path="/admin/productupdate/:productNo" element={<AdminProductUpdCon />} />
          <Route path="/admin/memberList" element={<AdminMemberListCon />} />
          <Route path="/admin/campproductlist" element={<AdminCampListCon />} />
          <Route path="/admin/campproductadd" element={<AdminCampAddCon />} />
          <Route path="/admin/campproductupdate/:campNo" element={<AdminCampUpdCon />} />
          <Route path="/admin/campdetailinsert/:campNo/:userNo" element={<AdminCampDAddCon />} />
          {/* 광고 */}
          <Route path="/admin/adinsert/:campNo" element={<AdminAdApplyCon />} />
          <Route path="/admin/adlist" element={<AdminAdListCon />} />
          <Route path="/admin/adlistseller" element={<AdminSAdListCon />} />
          {/* 게시판 */}
          <Route path="/api/board/index" element={<CampBoardMainCon />} />
          <Route path="/api/board/crread/:reviewNo" element={<CampBoardReadCon />} />
          <Route path="/api/board/prread/:prNo" element={<ProductBoardReadCon />} />
          <Route path="/api/board/crinsert/:reservationNo" element={<CampBoardInsertCon />} />
          <Route path="/api/board/prinsert/:orderNo" element={<ProductBoardInsertCon />} />
          <Route path="/api/board/crupdate/:reviewNo" element={<CampBoardUpdateCon />} />
          <Route path="/api/board/prupdate/:prNo" element={<ProductBoardUpdateCon />} />
          <Route path="/api/board/boardlist" element={<CampBoardListCon />} />
          {/* 유저넘버 넘기는건 확인해봐야 함  */}
          <Route path="/admin/campdetailupdate/:cpdtNo" element={<AdminDCampUpdCon />} />

          {/* Error */}
          <Route path="/error/404" element={<NotFound />} />      {/* TODO : 404 페이지 꾸미기 */}
          <Route path="/error/500" element={<ServerError />} />  {/* TODO : 500 페이지 꾸미기 */}
          <Route path="/error/test" element={<Test />} />  {/* TODO : 500 페이지 꾸미기 */}
          <Route path="/*" element={<NotFound />} />             {/* Info : 맨 마지막에 있어야합니다. */}

        </Routes>
      </CategoryProvider>
    </BrowserRouter>

  )
}
export default App;