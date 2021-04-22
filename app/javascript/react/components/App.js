import React from "react";
import { BrowserRouter, Route } from "react-router-dom";
import CoffeeShopShowContainer from "./CoffeeShopShowContainer";

export const App = (props) => {
  return (
    <BrowserRouter>
      <Route exact path="/coffee_shops/:id" component={CoffeeShopShowContainer} />
    </BrowserRouter>
  );
};

export default App;
