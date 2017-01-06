package com.flyout.service;

import com.flyout.dao.QuestionDaoImpl;
import com.flyout.domain.Question;
import org.hibernate.Hibernate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by LiMeiyuan on 2017/1/5.
 * Description:
 */
@Service
public class QuestionServiceImpl {
    @Resource
    private QuestionDaoImpl questionDao;

    public void save(Question question) {
        questionDao.saveOrUpdate(question, question.getId());
    }

    public List<Question> getRecommend(Integer limit) {
        return questionDao.getRecommend(limit);
    }

    public Question get(Long id) {
        Question question = questionDao.find(id);
        Hibernate.initialize(question.getAnswerList());
        return question;
    }
}
