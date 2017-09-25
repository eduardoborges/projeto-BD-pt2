import React from 'react';
import { Link } from 'react-router-dom';

const NotFound = () => {
    return (
        <section className="hero is-fullheight is-danger">
            <div className="hero-body">
                <div className="container">
                    <h1 className="title">
                        Opa opa!
                    </h1>
                    <h2 className="subtitle">
                        Página não encontrada.
                    </h2>
                    <Link to="/">Voltar para o inicio</Link>
                </div>
            </div>
        </section>
    );
}

export default NotFound;