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
            mes: "4",
            ano: "2017",
            _isLoading: false,
            _meses: [
                {
                    number: 1,
                    nome: 'Janeiro'
                },
                {
                    number: 2,
                    nome: 'Fevereiro'
                },
                {
                    number: 3,
                    nome: 'Março'
                },
                {
                    number: 4,
                    nome: 'Abril'
                },
                {
                    number: 5,
                    nome: 'Maio'
                },
                {
                    number: 6,
                    nome: 'Junho'
                },
                {
                    number: 7,
                    nome: 'Julho'
                },
                {
                    number: 8,
                    nome: 'Agosto'
                },
                {
                    number: 9,
                    nome: 'Setembro'
                },
                {
                    number: 10,
                    nome:  'Outubro'
                },
                {
                    number: 11,
                    nome:  'Novembro'
                },
                {
                    number: 12,
                    nome:  'Dezembro'
                }
            ]

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
            .query6(this.state.mes, this.state.ano)
            .then( resp => this.setState({ data: resp.data, _isLoading: false }) );
    }

    render(){

        return (

            <main>

                <h1 className="title">Query 6</h1>
                <h3 className="subtitle">Qual o cpf, o nome, o salário-base e o salário final do funcionário no mês selecionado?</h3>
                
                   

                <Columns multiline>
                    <form onSubmit={ this.handleSearch.bind(this) }>
                        <Column is="12">
                            <div className="field">
                                <label className="label">Mês</label>
                                <div className="control">
                                    <div className="select">
                                    <select name="mes" value={this.state.mes} onChange={this.handleChange.bind(this)}>
                                    {
                                        this.state._meses.map( mes =>
                                            (<option value={mes.number} key={mes.nome}>{mes.nome}</option>)
                                        )
                                    }
                                    </select>
                                    </div>
                                </div>
                            </div>

                            <div className="field">
                            <label className="label">Ano</label>
                            <div className="control">
                                <input required autoComplete="off" value={this.state.ano} type="text" className="input" name="ano" pattern="[0-9]{4}$" onChange={ this.handleChange.bind(this) } placeholder="Formato: AAAA" />
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
                                        <Td column="CPF" data={ item.cpf } />
                                        <Td column="Nome do funcionário" data={ item.nome } />
                                        <Td column="Salário Base" data={ `R$ ${item.salario_base.replace('.',',')}` } />
                                        <Td column="Salário Final" data={ `R$ ${item.salario_final.replace('.',',')}` } />
                                        <Td column="Quant. de Ingressos" data={ item.quantidade_ingressos } />
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