import React from 'react';
import { connect } from 'react-redux';

function Ingredients() {
  return (
    <div>
      <h2>You got a stocked fridge bro.</h2>
      <LoggedInOrNot />
    </div>
  );
}

function LOI({session}) {
  if (session) {
    return <p>What is going on {session.username}</p>	  
  } else {
    return <p>Log in to see your ingredients.</p>
  }
}

const LoggedInOrNot =  connect(
  ({session}) => ({session}))(LOI);

function state2props() {
  return {};
}

export default connect(state2props)(Ingredients);
