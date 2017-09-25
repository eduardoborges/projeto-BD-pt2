import API from './';

class QuerysAPI {
    static query1(nome) {
        return API.get(`/query1/${nome}`);
    }

    static query2(id) {
        return API.get(`/query2/${id}`);
    }

    static query3(ano) {
        return API.get(`/query3/${ano}`);
    }

    static query4(dataInicial, dataFinal) {
        return API.get(`/query4/${dataInicial}/${dataFinal}`);
    }

    static query5(dataInicial, dataFinal) {
        return API.get(`/query5/${dataInicial}/${dataFinal}`);
    }

    static query6(mes, ano) {
        return API.get(`/query6/${mes}/${ano}`);
    }

    static query7(arrecadacao, ano) {
        return API.get(`/query7/${arrecadacao}/${ano}`);
    }

    static query8(cpf) {
        return API.get(`/query8/${cpf}`);
    }

    static query9() {
        return API.get(`/query9`);
    }

    static query10() {
        return API.get(`/query10`);
    }

}

export default QuerysAPI;