import React from 'react';
import { HashRouter as Router, Route, Redirect } from 'react-router-dom';

import Home     from './views/Home';
import Overview from './views/Dashboard/Overview';
import Querys from './views/Dashboard/Querys';

class Routes extends React.Component {
  render() {
    const supportsHistory = 'pushState' in window.history;

    return(
      <Router forceRefresh={!supportsHistory}>
         <div>
          <Route path="/" exact component={Home} />
          <Route path="/dashboard/" exact component={Overview} />
          <Route path="/dashboard/query/" component={Querys} />
       </div>
      </Router>
    );
  }
}

export default Routes;