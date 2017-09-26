import React, {Component} from 'react';

import QuerysAPI from '../../../api/querys';
import numeral from 'numeral';
import 'numeral/locales';

import {Columns, Column} from '../../../components/Grid';
import Reactable from 'reactable';

var Table = Reactable.Table,
    Thead = Reactable.Thead,
    Th = Reactable.Th,
    Tr = Reactable.Tr,
    Td = Reactable.Td;


numeral.locale('pt-br');

class Query1 extends Component {

    constructor(props) {
        super(props);
        this.state = {
            data: [],
            nome: ""
        };
    }

    handleChange(e){
        this.setState({
            [e.target.name] : e.target.value
        })
    }

    handleSearch(e){
        e.preventDefault();
        QuerysAPI
            .query1(this.state.nome)
            .then( resp => this.setState({ data: resp.data }) );
    }

    render(){

        return (

            <main>

                <h1 className="title">Pesquisa de cliente por nome</h1>
                <h3 className="subtitle">Retorna a quantidade de ingressos que o cliente já comprou até o momento
                e o total de quanto o cliente já gastou até o momento</h3>
                   

                <Columns multiline>
                    <form onSubmit={ this.handleSearch.bind(this) }>
                        <Column is="12">
                            <div className="field">
                                <label className="label">Name</label>
                                <div className="control">
                                    <input autoComplete="off" required className="input" type="text" name="nome" onChange={ this.handleChange.bind(this) }  placeholder="Nome do Cliente" />
                                </div>
                            </div>
                        </Column>
                        <Column is="6">
                            <button className="button is-primary is-merdium is-block">Pesquisar</button>
                        </Column>
                    </form>
                </Columns>

                {
                    this.state.data ? (
                        <Table className="table">
                            {
                                this.state.data.map(item => (
                                    <Tr>
                                        <Td column="CPF Cliente" data={ item.cpf_cliente } />
                                        <Td column="Nome Cliente" data={ item.nome_cliente } />
                                        <Td column="Ingressos Comprados" data={ item.ingressos_comprados } />
                                        <Td column="Total Gasto" data={ numeral( item.total_gasto ).format('$ 0,0[.]00')  } />
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
export default Query1;