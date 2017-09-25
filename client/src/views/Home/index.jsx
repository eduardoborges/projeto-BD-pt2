
import React from 'react';
import { Link } from 'react-router-dom';


class Index extends React.Component {
    render(){
        return (
            <section className="hero is-fullheight">
                <div className="hero-body">
                    <div className="container">
                        <h1 className="title">
                            Cinema Project
                        </h1>
                        <h2 className="subtitle">
                            Banco de dados 2017.1
                        </h2>
                        <div className="control">
                            <Link className="button is-primary is-outlined" to="/dashboard">Dashboard</Link>
                        </div>
                    </div>
                </div>

                <div className="hero-footer">
                    <div className="container">
                        <p>Desenvolvido por <Link to="/404">Eduardo Borges</Link> e <Link to="/404">Lucas Cruz</Link></p>
                        <br/>
                    </div>
                </div>
            </section>
        );
    }
}

export default Index;