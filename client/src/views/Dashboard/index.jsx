import React from 'react';
import { NavLink } from 'react-router-dom';


const DashboardTitle = (props) => (
    <div>
        <h1 className="title">{props.title}</h1>
        <h2 className="subtitle">{props.subTitle}</h2>
    </div>
);

const DashboardContent = (props) => (
    <div className="column is-9">   
        <section>
            <DashboardTitle title={props.tile} subTitle={props.subTitle} />
            {props.children}
        </section>    
    </div>
);

const DashboardFooter = (props) => (
    <footer className="footer">
        <div className="container">
            <div className="has-text-centered">
            <p>
                <i>Projeto construido como avaliação para a disciplina de Banco de Dados pelo professor André Brito na Universidade Federal de Sergipe período 2017.1</i>  <br/>
                <strong>CinemaCMS Project</strong> pof <a href="http://github.com/eduardoborges" target="_blank"  rel="noopener noreferrer">Eduardo Borges</a> e <a href="" target="_blank"  rel="noopener noreferrer">Lucas Cruz</a>
                <hr />
                <i>Ambiente: {process.env.NODE_ENV } | Host da API: {process.env.REACT_APP_API_HOST}</i>
            </p>
            </div>
        </div>
    </footer>
);

const DashboardHeader = (props) => (
    <nav className="nav has-shadow">
        <div className="container">
            <div className="nav-left">
                <a className="nav-item">Cinema</a>
            </div>

            <span className="nav-toggle">
                <span></span>
                <span></span>
                <span></span>
            </span>

            <div className="nav-right nav-menu">
                <a className="nav-item is-tab is-active">
                    { 'Olá, Fulano' }
                </a>
                <a className="nav-item is-tab" onClick={ () => alert("Isso aqui é só pra simulacao mesmo") }>Sair</a>
            </div>
        </div>
    </nav>

);

const SidebarItem = (props) => (
   <li>
      <NavLink to={props.to} exact={props.exact || false} activeClassName="is-active">{props.title}</NavLink>
      <ul>
        {props.children}
      </ul>
    </li>

);


const DashboardSidebar = (props) => (
    
    <div className="column is-3">
        <aside className="menu">

            <p className="menu-label">Geral</p>
            <ul className="menu-list">
                <SidebarItem to="/dashboard/" exact={true} title="Overview" />
            </ul>

            <p className="menu-label">Querys</p>
            <ul className="menu-list">
                <SidebarItem to="/dashboard/query/1"      title="Query 1" />
                <SidebarItem to="/dashboard/query/2"      title="Query 2" />
                <SidebarItem to="/dashboard/query/3"      title="Query 3" />
                <SidebarItem to="/dashboard/query/4"      title="Query 4" />
                <SidebarItem to="/dashboard/query/5"      title="Query 5" />
                <SidebarItem to="/dashboard/query/6"      title="Query 6" />
                <SidebarItem to="/dashboard/query/7"      title="Query 7" />
                <SidebarItem to="/dashboard/query/8"      title="Query 8" />
                <SidebarItem to="/dashboard/query/9"      title="Query 9" />
                <SidebarItem to="/dashboard/query/10"     title="Query 10" />
                
            </ul>

        </aside>
    </div>

);


const Dashboard = (props) => (
    <div>
        <DashboardHeader />
        <div className="section">
            <div className="container">
                <div className="columns is-multiline">
                        <DashboardSidebar /> 
                        <DashboardContent title={props.title} subTitle={props.subTitle}>
                            {props.children}
                        </DashboardContent>
                    <DashboardFooter />
                </div>
            </div>
        </div>
    </div>
);


export default Dashboard;