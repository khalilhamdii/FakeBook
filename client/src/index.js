require('@rails/ujs').start();
require('turbolinks').start();
require('@rails/activestorage').start();

import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);
