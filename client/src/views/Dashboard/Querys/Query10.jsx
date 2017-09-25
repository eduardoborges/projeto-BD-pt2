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
        }

        QuerysAPI.query10()
            .then( resp => this.setState({ data: resp.data }) );
    }

    handleChange(e){
        this.setState({
            [e.target.name] : e.target.value
        })
    }

    render(){

        return (

            <main>

                <h1 className="title">Listagem da quantidade de vendedores e gerentes por estado</h1>
                
                

                {
                    this.state.data.length ? (
                        <Table className="table" data={this.state.data}>
                            <Thead>
                                <Th column="estado">
                                    Estado
                                </Th>
                                <Th column="quantidade_gerentes">
                                    Quant. Gerentes
                                </Th>
                                <Th column="quantidade_vendedores">
                                    Quant. Vendedores
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