package br.com.caelum.tarefas.jpa;

import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import br.com.caelum.tarefas.dao.TarefaDao;
import br.com.caelum.tarefas.modelo.Tarefa;

@Repository
public class JpaTarefaDao implements TarefaDao {

	@PersistenceContext
	EntityManager manager;
	

	
	
	@Transactional
	@Override
	public Tarefa buscaPorId(Long id) {
		// TODO Auto-generated method stub
		return this.manager.find(Tarefa.class, id);
	}

	@Transactional
	@Override
	public List<Tarefa> lista() {
		// TODO Auto-generated method stub
		
	return this.manager.createQuery("select t from Tarefa t").getResultList();
	}
	@Transactional
	@Override
	public void adiciona(Tarefa t) {
		// TODO Auto-generated method stub
		System.out.println("descricao " + t.getDescricao());
		t.setDataFinalizacao(Calendar.getInstance());
		t.setFinalizado(false);
		this.manager.persist(t);
	}
	@Transactional
	@Override
	public void altera(Tarefa t) {
		// TODO Auto-generated method stub
		this.manager.merge(t);
	}
	@Transactional
	@Override
	public void remove(Tarefa t) {
		// TODO Auto-generated method stub
		Tarefa tarefaARemover = buscaPorId(t.getId());
		this.manager.remove(tarefaARemover);
	}
	@Transactional
	@Override
	public void finaliza(Tarefa t) {
		// TODO Auto-generated method stub
		Tarefa tarefa = buscaPorId(t.getId());
		tarefa.setFinalizado(true);
		tarefa.setDataFinalizacao(Calendar.getInstance());
		this.manager.merge(t);
	}

}
