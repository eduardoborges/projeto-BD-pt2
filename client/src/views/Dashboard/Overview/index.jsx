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
                    Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker.
                    </p>
                </div>
            </Dashboard>
        );
    }
}

export default Overview;