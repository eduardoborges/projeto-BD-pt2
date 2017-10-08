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


class Query extends Component {

    constructor(props) {
        super(props);
        this.state = {
            data: [],
            arrecadacao: "50",
            ano: "2017",
            _isLoading: false
        }
    }

    handleChange(e){
        this.setState({
            [e.target.name] : e.target.value
        })
    }

    handleSearch(e){
        e.preventDefault();
        this.setState({ _isLoading: true })
        QuerysAPI
            .query7(this.state.arrecadacao, this.state.ano)
            .then( resp => this.setState({ data: resp.data, _isLoading: false }) );
    }

    render(){

        return (

            <main>

                <h1 className="title">Query 7</h1>
                <h3 className="subtitle">Qual a arrecadacão e quantidade de clientes por estado?</h3>
                
                   

                <Columns multiline>
                    <form onSubmit={ this.handleSearch.bind(this) }>
                        <Column is="12">
                            <div className="field">
                                <label className="label">Arrecadacão Minima</label>
                                <div className="control">
                                    <input autoComplete="off" required type="text" value={this.state.arrecadacao} className="input" name="arrecadacao" pattern="[0-9]+$" onChange={ this.handleChange.bind(this) } placeholder="Quantidade" />
                                </div>
                            </div>

                            <div className="field">
                            <label className="label">Ano</label>
                            <div className="control">
                                <input autoComplete="off" required type="text"  value={this.state.ano} className="input" name="ano" pattern="[0-9]{4}$" onChange={ this.handleChange.bind(this) } placeholder="Formato: AAAA" />
                            </div>
                        </div>
                      
                        </Column>
                        <Column is="6">
                            <button className={"button is-primary is-merdium is-block " + (this.state._isLoading?'is-loading':'')}>Pesquisar</button>
                        </Column>
                    </form>
                </Columns>

                {
                    this.state.data.length ? (
                        <Table className="table">
                            {
                                this.state.data.map(item => (
                                    <Tr key={item.id}>
                                        <Td column="Estado" data={ item.estado } />
                                        <Td column="Clientes por estado" data={ item.clientes_por_estado } />
                                        <Td column="Arrecadação" data={ `R$ ${item.arrecadacao_estado.replace('.',',')}` } />
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
export default Query;