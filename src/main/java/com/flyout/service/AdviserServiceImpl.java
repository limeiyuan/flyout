package com.flyout.service;

import com.flyout.dao.AdviserDaoImpl;
import com.flyout.domain.Adviser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by LiMeiyuan on 2016/11/10 15:04.
 * description:
 */
@Service
public class AdviserServiceImpl {
    @Autowired
    private AdviserDaoImpl adviserDao;

    public List<Adviser> getRecommendAdviser() {
        List<String> names = new ArrayList<>();
        names.add("au0001");
        names.add("CN0035");
        names.add("AU0048");
        names.add("AU0047");
        names.add("US0001");
        names.add("CN0030");
        names.add("CN0001");
        names.add("PC0006");
        names.add("PC0003");
        names.add("PC0001");
        List<Adviser> advisers = new ArrayList<>(names.size());
        for (String name : names) {
            Adviser adviser = adviserDao.findByUsername(name);
            if (adviser != null) {
                advisers.add(adviser);
            }
        }
        return advisers;
    }
}
