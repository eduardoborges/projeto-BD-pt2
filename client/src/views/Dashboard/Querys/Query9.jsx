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
        QuerysAPI.query9()
            .then( resp => this.setState({ data: resp.data }) );

    }

    render(){

        return (

            <main>

                <h1 className="title">Listagem de filmes que não possuem nenhum ingresso vendido</h1>
                

                <Columns multiline>
                    <form onSubmit={ this.handleSearch.bind(this) }>
                        <Column is="12">

                            
                      
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
                                <Th column="nome">
                                    Nome do Filme
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