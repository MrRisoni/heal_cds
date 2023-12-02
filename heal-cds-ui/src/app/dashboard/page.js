import { useEffect, useState } from "react";




// http://localhost:3000/dashboard

export const  Page =() => {

  /*
useEffect(() => {


  fetch('http://localhost:8000/mrt/boss/assigns/6')
  .then(res => {
    console.log(res);
  })
);} */


  return (
    <ul>
      {posts.map((post) => (
        <li>{post.title}</li>
      ))}
    </ul>
  )
}

export default Page;
