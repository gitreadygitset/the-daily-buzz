import React from 'react'
import {BrowserRouter, Route} from "react-router-dom"
import CoffeeShopShowContainer from "./CoffeeShopShowContainer"

export const App = (props) => {
  return (
  <BrowserRouter>
    <Route exact path="/coffee_shops/1" component={CoffeeShopShowContainer}/>
  </BrowserRouter>)
}

export default App
