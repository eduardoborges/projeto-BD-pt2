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


class Query3 extends Component {

    constructor(props) {
        super(props);
        this.state = {
            data: [],
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
            .query3(this.state.ano)
            .then( resp => this.setState({ data: resp.data }) );
    }

    render(){

        return (

            <main>

                <h1 className="title">Quantidade de ingressos vendidos por mês em um ano</h1>
                { /* <h3 className="subtitle">Retorna a lista de sessões por gênero</h3> */ }
                   

                <Columns multiline>
                    <form onSubmit={ this.handleSearch.bind(this) }>
                        <Column is="12">
                            <div className="field">
                                <label className="label">Ano</label>
                                <div className="control">
                                    <input autoComplete="off" type="text" className="input" name="ano" onChange={ this.handleChange.bind(this) } placeholder="Ano" />
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
                                <Th column="mes">
                                    Mês
                                </Th>
                                <Th column="quantidade_ingressos">
                                    Quant. de Ingressos
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
export default Query3;