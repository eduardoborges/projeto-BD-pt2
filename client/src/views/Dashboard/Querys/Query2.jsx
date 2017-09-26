import React, {Component} from 'react';
import moment from 'moment';
import 'moment/locale/pt-br';

import {Link} from 'react-router-dom';
import QuerysAPI from '../../../api/querys';
import HelpersAPIs from '../../../api/apis';

import {Columns, Column} from '../../../components/Grid';
import Reactable from 'reactable';

var Table = Reactable.Table,
    Thead = Reactable.Thead,
    Th = Reactable.Th,
    Tr = Reactable.Tr,
    Td = Reactable.Td;


class Query2 extends Component {

    constructor(props) {
        super(props);
        this.state = {
            data: [],
            id: "",
            _generos: []
        };

        HelpersAPIs.generos()
        .then( resp => this.setState({ _generos: resp.data }) );

        
    }

    handleChange(e){
        this.setState({
            [e.target.name] : e.target.value
        })
    }

    handleSearch(e){
        e.preventDefault();
        QuerysAPI
            .query2(this.state.id)
            .then( resp => this.setState({ data: resp.data }) );
    }

    render(){

        return (

            <main>

                <h1 className="title">Query 2</h1>
                <h3 className="subtitle">Qual a lista de sessões por gênero?</h3>
                   

                <Columns multiline>
                    <form onSubmit={ this.handleSearch.bind(this) }>
                        <Column is="12">
                            <div className="field">
                                <label className="label">Gênero</label>
                                <div className="control">
                                <div className="select">
                                    <select name="id" onChange={this.handleChange.bind(this)}>
                                    {
                                        this.state._generos.map( item =>
                                            (<option value={item.id_genero} key={item.id_genero}>{item.nome}</option>)
                                        )
                                    }
                                    </select>
                                </div>
                                </div>
                            </div>
                      
                        </Column>
                        <Column is="6">
                            <button className="button is-primary is-merdium is-block">Pesquisar</button>
                        </Column>
                    </form>
                </Columns>

                {
                    this.state.data.length ? (
                        <Table className="table">
                        {
                            this.state.data.map(item => (
                                <Tr>
                                    <Td column="Nome do Filme" data={ item.nome } />
                                    <Td column="# da Sala" data={ item.numero } />
                                    <Td column="Horário da Sessão" data={ moment(item.data_hora).format('LLLL') } />
                                </Tr>
                            ))
                        }
                    </Table>
                    ) : ( 
                        <div>
                            <hr/>
                            <h2 className="subtitle">Nenhum resultado</h2>
                        </div>
                        
                    )
                }
                
  
            </main>
            
        );
        
    }

}
export default Query2;