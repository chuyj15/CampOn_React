import React, { useContext, useEffect, useState } from 'react'
import BackCartHeader from '../../components/header/BackCartHeader'
import ProductDetail from '../../components/product/ProductDetail'
import ProductDetailReview from '../../components/product/ProductDetailReview'
import ProductInformation from '../../components/product/ProductInformation'
import CampOnFooter from '../../components/footer/CampOnFooter'
import UserFooter from '../../components/menu/UserFooter'
import * as products from '../../apis/product';
import { CategoryContext } from '../../apis/CategoryContext';
import { useNavigate } from 'react-router-dom'

const ProductDetailContainer = () => {
  const { isLogin, userInfo } = useContext(CategoryContext);
    let navigate = useNavigate();
    let confirm = '';
    
    const contextValue = useContext(CategoryContext);
    const productNo = contextValue.productNo;
    // console.log(contextValue.productNo);

    const [ product, setProduct ] = useState();
    const [ productReview, setProductReview ] = useState();
    const [ reviewCount, serReviewCount ] = useState();
    const [ moreState, setMoreState ] = useState(false);
    const [ rentInfo, setRentInfo] = useState(false)
    const [ productInfo, setProductInfo] = useState(false)
    // console.log(rentInfo);

    const getPrdocut = async () => {
        const response = await products.productDetaile(productNo);
        const product = response.data.product;
        const productReview = response.data.proReviewList;
        const reviewCount = response.data.reviewCount;
        // console.log(product);
        // console.log(productReview);
        // console.log(reviewCount);
        setProduct(product);
        setProductReview(productReview);
        serReviewCount(reviewCount)
    }

    const addCart = ( async (productNo) => {
      if (!isLogin) {
          alert('로그인하고 이용 가능합니다.')
          navigate(`/user/login`)
          return
      }
      let userNo = userInfo?.userNo; 
      let pNo = productNo;
      const response = await products.addProductsave(pNo, userNo);
      const data = response.data;
      if( data === 'SUCCESS') {
        alert('장바구니에 등록되었습니다.');
        confirm = window.confirm('장바구니로 이동하시겠습니까?')
        if(confirm) {
          navigate('/product/cart');
        }
      }
      else alert('이미 장바구니에 등록된 상품 입니다.')
    })

    const addProductsave = ( async (productNo) => {
      if (!isLogin) {
        alert('로그인하고 이용 가능합니다.')
        navigate(`/user/login`)
        return
    }
      console.log(productNo);
      const response = await products.wishListAdd(productNo);
      const data = await response.data;
      // console.log(data);
      if(data === 'SUCCESS') {
        alert('찜에 등록되었습니다.')
        confirm = window.confirm('찜 목록으로 이동하시겠습니까?');
        if(confirm) {
          navigate('/product/wishlist');
        } 
      }
      else alert('이미 찜에 등록된 상품입니다.')
    })

    const moreBtn = () => {
      setMoreState(true);
    }
    const rentInfoClick = () => {
      setRentInfo(true);
    }
    const closeBtn = () => {
      setRentInfo(false);
    }
    const productInfoClick = () => {
      setProductInfo(true);
    }
    const closeProductBtn = () => {
      setProductInfo(false);
    }

    useEffect(() => {
        getPrdocut();
    }, [productNo])

  return (
    <>
        <BackCartHeader />
        <ProductDetail product={product} reviewCount={reviewCount} addProductsave={addProductsave} moreBtn={moreBtn} moreState={moreState} addCart={addCart}/>
        <ProductDetailReview productReview={productReview} />
        <ProductInformation rentInfo={rentInfo} rentInfoClick={rentInfoClick} 
                            productInfoClick={productInfoClick} productInfo={productInfo} 
                            closeBtn={closeBtn} closeProductBtn={closeProductBtn} />
        <CampOnFooter />
        <UserFooter />
    </>
  )
}

export default ProductDetailContainer