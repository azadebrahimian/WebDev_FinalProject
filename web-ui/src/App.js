import React from 'react';
import { Container } from 'react-bootstrap';
import { Switch, Route } from 'react-router-dom';
import UsersNew from './Users/New';
import UsersList from './Users/List';
import ShowIngredients from './Ingredients/Show';
import Nav from './Nav';
import Home from './Home';
import './App.scss';
import 'bootstrap/dist/css/bootstrap.min.css';

function App() {
    return (
      <Container>
	<Nav />
        <Switch>
          <Route path="/" exact>
            <Home />
	  </Route>
	  <Route path="/users" exact>
	    <UsersList />
	  </Route>
	  <Route path="/users/new" exact>
	    <UsersNew />
	  </Route>
	  <Route path="/ingredients" exact>
	    <ShowIngredients />
	  </Route>
	</Switch>
      </Container>
    );
}

export default App;
