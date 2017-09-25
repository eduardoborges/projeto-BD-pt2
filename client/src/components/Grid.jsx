import React from 'react';

const Columns = (props) => (
    <div className={"columns " + (props.multiline ? 'is-multiline': '')}>
        {props.children}
    </div>
);

const Column = (props) => (
    <div className={"column is-" + props.is}>
        {props.children}
    </div>
);

const Container = (props) => (
    <div className="container">
        {props.children}
    </div>
);

const Button = (props) => (
    <button className={"button is-" + props.is}>
        {props.children}
    </button>
);

export {
    Columns,
    Column,
    Container,
    Button
}