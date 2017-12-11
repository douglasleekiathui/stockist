package com.t4.todo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TodoRestController {
	@Autowired
	TodoService service;

	@RequestMapping(value = "/todos")
	public List<Todo> retrieveAllTodos() {
		return service.retrieveTodos("t4");//[miki hardcoded for testing]
	}

	@RequestMapping(value = "/todos/{id}")
	public Todo retrieveTodo(@PathVariable int id) {
		return service.retrieveTodo(id);
	}

}