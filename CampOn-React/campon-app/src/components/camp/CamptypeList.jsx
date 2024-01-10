import React from 'react'
import { Link } from 'react-router-dom'

const CamptypeList = ({camptypeList}) => {
  return (
    <div>
        <ul className="camping_type d-flex justify-content-around py-3 my-5">
            {camptypeList.map((camp) => (
                <Link to={`/api/camp/campproducts?campTypeNo=${camp.campTypeNo}`} >
                    <ul>
                        <li><img src={camp.campTypeImg} alt="" /></li>
                        <li><span>{camp.campTypeName}</span></li>
                    </ul>
                </Link>
            ))}
        </ul>
    </div>
  )
}

export default CamptypeList