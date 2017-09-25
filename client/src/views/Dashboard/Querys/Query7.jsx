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
            arrecadacao: "",
            ano: ""

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
            .query7(this.state.arrecadacao, this.state.ano)
            .then( resp => this.setState({ data: resp.data }) );
    }

    render(){

        return (

            <main>

                <h1 className="title">Informações de pagamento do funcionário por mês</h1>
                <h3 className="subtitle">Retorna o cpf, o nome, o salário-base e o salário final do funcionário no mês selecionado</h3>
                
                   

                <Columns multiline>
                    <form onSubmit={ this.handleSearch.bind(this) }>
                        <Column is="12">
                            <div className="field">
                                <label className="label">Arrecadacão Minima</label>
                                <div className="control">
                                    <input autoComplete="off" required type="text" className="input" name="arrecadacao" pattern="[0-9]+$" onChange={ this.handleChange.bind(this) } placeholder="Quantidade" />
                                </div>
                            </div>

                            <div className="field">
                            <label className="label">Ano</label>
                            <div className="control">
                                <input autoComplete="off" required type="text" className="input" name="ano" pattern="[0-9]{4}$" onChange={ this.handleChange.bind(this) } placeholder="Formato: AAAA" />
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
                                <Th column="estado">
                                    Estado
                                </Th>
                                <Th column="clientes_por_estado">
                                    Clientes por estado
                                </Th>
                                <Th column="arrecadacao_estado">
                                    Arrecadação
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
export default Query;