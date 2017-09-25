import React, {Component} from 'react';
import moment from 'moment';
import 'moment/locale/pt-br';

import {Link} from 'react-router-dom';
import QuerysAPI from '../../../api/querys';

import {Columns, Column} from '../../../components/Grid';
import Reactable from 'reactable';

var Table = Reactable.Table,
    Thead = Reactable.Thead,
    Th = Reactable.Th,
    Tr = Reactable.Tr,
    Td = Reactable.Td;


class Query4 extends Component {

    constructor(props) {
        super(props);
        this.state = {
            data: [],
            data_inicio: "",
            data_final: ""
        }
    }

    handleChange(e){
        this.setState({
            [e.target.name] : e.target.value
        })
    }

    handleSearch(e){
        e.preventDefault();
        QuerysAPI
            .query5(this.state.data_inicio, this.state.data_final)
            .then( resp => this.setState({ data: resp.data }) );
    }

    render(){

        return (

            <main>

                <h1 className="title">Filmes em exibição em um intervalo de tempo</h1>
                
                   

                <Columns multiline>
                    <form onSubmit={ this.handleSearch.bind(this) }>
                        <Column is="12">
                            <div className="field">
                                <label className="label">Data Inicial</label>
                                <div className="control">
                                    <input autoComplete="off" required type="date" className="input" name="data_inicio" onChange={ this.handleChange.bind(this) } placeholder="Data Inicio" />
                                </div>
                            </div>

                            <div className="field">
                            <label className="label">Data Final</label>
                            <div className="control">
                                <input autoComplete="off" required type="date" className="input" name="data_final" onChange={ this.handleChange.bind(this) } placeholder="Data Final" />
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
                        <Table className="table" data={this.state.data}>
                            <Thead>
                                <Th column="nome_filme">
                                    Nome do Filme
                                </Th>
                                <Th column="data">
                                    Data e hora
                                </Th>
                            </Thead>
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
export default Query4;