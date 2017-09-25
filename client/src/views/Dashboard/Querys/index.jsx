import React from 'react';
import { HashRouter as Router, Route } from 'react-router-dom';

import Dashboard from '../';
import Query1 from './Query1';
import Query2 from './Query2';
import Query3 from './Query3';
import Query4 from './Query4';
import Query5 from './Query5';
import Query6 from './Query6';
import Query7 from './Query7';
import Query8 from './Query8';
import Query9 from './Query9';
import Query10 from './Query10';

const QuerysDashboard = (props) => (
    <Dashboard>
        <Router>
            <div>
                <Route path="/dashboard/query/1" exact component={Query1} />
                <Route path="/dashboard/query/2" exact component={Query2} />
                <Route path="/dashboard/query/3" exact component={Query3} />
                <Route path="/dashboard/query/4" exact component={Query4} />
                <Route path="/dashboard/query/5" exact component={Query5} />
                <Route path="/dashboard/query/6" exact component={Query6} />
                <Route path="/dashboard/query/7" exact component={Query7} />
                <Route path="/dashboard/query/8" exact component={Query8} />
                <Route path="/dashboard/query/9" exact component={Query9} />
                <Route path="/dashboard/query/10" exact component={Query10} />
            </div>
        </Router>
    </Dashboard>
);

export default QuerysDashboard;