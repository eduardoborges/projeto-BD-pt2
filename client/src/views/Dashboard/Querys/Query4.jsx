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
            data_inicio: "2010-01-01",
            data_final: "2017-10-12",
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
        this.setState({
            _isLoading: true
        })
        QuerysAPI
            .query4(this.state.data_inicio, this.state.data_final)
            .then( resp => this.setState({ data: resp.data, _isLoading: false }) );
    }

    render(){

        return (

            <main>

                <h1 className="title">Query 4</h1>
                <h3 className="subtitle"> Qual a q⁠⁠⁠⁠uantidade de ingressos e valor total de ingressos vendidos por cada funcionário em um intervalo de tempo?</h3>
                   

                <Columns multiline>
                    <form onSubmit={ this.handleSearch.bind(this) }>
                        <Column is="12">
                            <div className="field">
                                <label className="label">Data Inicial</label>
                                <div className="control">
                                    <input autoComplete="off" required type="date" value={this.state.data_inicio} className="input" name="data_inicio" onChange={ this.handleChange.bind(this) } placeholder="Data Inicio" />
                                </div>
                            </div>

                            <div className="field">
                            <label className="label">Data Final</label>
                            <div className="control">
                                <input autoComplete="off" required type="date" value={this.state.data_final} className="input" name="data_final" onChange={ this.handleChange.bind(this) } placeholder="Data Final" />
                            </div>
                        </div>
                      
                        </Column>
                        <Column is="6">
                            <button className={"button is-primary is-merdium is-block " +(this.state._isLoading?'is-loading':'') }>Pesquisar</button>
                        </Column>
                    </form>
                </Columns>

                {
                    this.state.data.length ? (
                        <Table className="table">
                            {
                                this.state.data.map(item => (
                                    <Tr>
                                        <Td column="Nome do funcionário" data={ item.nome_funcionario } />
                                        <Td column="Quant. de Ingressos" data={ item.quantidade_ingressos } />
                                        <Td column="Total Vendido" data={ `R$ ${item.total_vendido.replace('.',',')}` } />
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
export default Query4;