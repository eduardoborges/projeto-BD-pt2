import React from 'react';

const Level = props => (
    <nav className="level">
        {props.children}
    </nav>
);

const LevelLeft = props => (
    <div className="level-left">
        {props.children}
    </div>
);

const LevelRight = props => (
    <div className="level-right">
        {props.children}
    </div>
);

const LevelItem = props => (
    <div className="level-item">
        {props.children}
    </div>
);

export { Level, LevelLeft, LevelRight, LevelItem }