import React, {Component} from 'react';
import moment from 'moment';
import 'moment/locale/pt-br';

import {Link} from 'react-router-dom';
import QuerysAPI from '../../../api/querys';
import HelpersAPI from '../../../api/apis';

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
            cpf: "",
            "_funcionarios": []
        }

        HelpersAPI.funcionarios()
            .then(resp => this.setState({ _funcionarios: resp.data }) );
    }

    handleChange(e){
        this.setState({
            [e.target.name] : e.target.value
        })
    }

    handleSearch(e){
        e.preventDefault();
        QuerysAPI
            .query8(this.state.cpf)
            .then( resp => this.setState({ data: resp.data }) );
    }

    render(){

        return (

            <main>


                <h1 className="title">Listagem de ingressos vendidos por funcionário</h1>
                <h3 className="subtitle">Retorna lista com o identificador do ingresso, a data da venda, o nome e o preço do filme</h3>

                <Columns multiline>
                    <form onSubmit={ this.handleSearch.bind(this) }>
                        <Column is="12">

                            <div className="field">
                                <label className="label">Funcionário</label>
                                <div className="control">
                                    <div className="select">
                                    <select name="cpf" onChange={this.handleChange.bind(this)}>
                                    {
                                        this.state._funcionarios.map( func =>
                                            (<option value={func.cpf} key={func.cpf}>{func.nome}</option>)
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
                        <Table className="table" data={this.state.data}>
                            <Thead>
                                <Th column="id_ingresso">
                                    #ID Ingresso
                                </Th>
                                <Th column="data">
                                    Data da venda
                                </Th>
                                <Th column="nome">
                                    Nome do Filme
                                </Th>
                                <Th column="preco">
                                    Preço do Ingresso
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