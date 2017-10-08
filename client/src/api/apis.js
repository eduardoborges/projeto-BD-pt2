import API from './';

class HelpersAPIs{
    static generos() {
        return API.get(`/generos`);
    }

    static funcionarios() {
        return API.get(`/funcionarios`);
    }
    
    static dbStatus(){
        return API.get(`/status`);
    }
}

export default HelpersAPIs;
