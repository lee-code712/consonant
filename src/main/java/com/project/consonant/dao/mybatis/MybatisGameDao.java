package com.project.consonant.dao.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.consonant.dao.GameDao;
import com.project.consonant.dao.mybatis.mapper.GameMapper;
import com.project.consonant.domain.Game;
import com.project.consonant.domain.Quiz;

@Repository
public class MybatisGameDao implements GameDao{
	@Autowired
	GameMapper gameMapper;

	@Override
	public int createGame(Game game) {
		// TODO Auto-generated method stub
		return gameMapper.createGame(game);
	}

	@Override
	public int createQuiz(Quiz quiz) {
		// TODO Auto-generated method stub
		return gameMapper.createQuiz(quiz);
	}

	

	
	
}
