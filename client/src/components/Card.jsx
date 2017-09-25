import React from 'react';


const Card = props => (
    <div class="card">
        {props.children}
    </div>
);

const CardHeader = props => (
    <header class="card-header">
        <p class="card-header-title">
            {props.title}
        </p>
    </header>

)

const CardContent = props => (
     <div class="card-content">
        <div class="content">
        {props.children}
        </div>
    </div>
);


const CardFooter = props => (
    <footer class="card-footer">
    {props.children}
    </footer>
)

const CardFooterItem = props => (
    <div class="card-footer-item">
    {props.children}
    </div>
);


export { Card, CardHeader, CardContent, CardFooter, CardFooterItem }