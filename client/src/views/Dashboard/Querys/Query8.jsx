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
            cpf: "63023835799",
            "_funcionarios": [],
            "_isLoading": false
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
        this.setState({ _isLoading: true })
        QuerysAPI
            .query8(this.state.cpf)
            .then( resp => this.setState({ data: resp.data, _isLoading: false }) );
    }

    render(){

        return (

            <main>


                <h1 className="title">Query 8</h1>
                <h3 className="subtitle">Quais foram os ingressos vendidos pelo funcionário com o identificador, a data da venda, o nome e o preço do filme ?</h3>

                <Columns multiline>
                    <form onSubmit={ this.handleSearch.bind(this) }>
                        <Column is="12">

                            <div className="field">
                                <label className="label">Funcionário</label>
                                <div className="control">
                                    <div className="select">
                                    <select name="cpf" value={this.state.cpf} onChange={this.handleChange.bind(this)}>
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
                            <button className={"button is-primary is-merdium is-block " + (this.state._isLoading?'is-loading':'') }>Pesquisar</button>
                        </Column>
                    </form>
                </Columns>

                {
                    this.state.data.length ? (
                        <Table className="table">
                            {
                                this.state.data.map(item => (
                                    <Tr key={item.id}>
                                        <Td column="#ID Ingresso" data={ item.id_ingresso } />
                                        <Td column="Data da venda" data={ moment(item.data).format('LLL') } />
                                        <Td column="Nome do Filme" data={ item.nome } />
                                        <Td column="Preço do Ingresso" data={ `R$ ${item.preco.replace('.',',')}` } />
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