import React, { Component } from 'react';
import API from '../../../api/';

import Dashboard from '../';

class Overview extends Component {
    
    constructor(props) {
        super(props);

        this.state = {
        }
    }

    render() {
        return (
            <Dashboard>
                <h1 className="title">Sobre o Projeto</h1>
                <h2 className="subtitle">Uma visão geral de tudo</h2>
                <hr/>
                
                <div className="content">

                    <p>
                        Projeto construido como avaliação para a disciplina de Banco de Dados pelo professor André Brito na Universidade Federal de Sergipe período 2017.1
                    </p>
                    <p>

                        Nesta aplicação desenvolvemos um pequeno sistema de cinema utilizando a arquitetura cliente - servidor da seguinte forma.
                    
                    </p>

                    <p>
                        Desenvolvido pelos alunos: Eduardo Borges e Lucas Cruz
                    </p>
                </div>
            </Dashboard>
        );
    }
}

export default Overview;