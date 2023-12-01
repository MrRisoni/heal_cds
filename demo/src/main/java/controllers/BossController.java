package controllers;

import entity.BossAbility;
import entity.HibernateUtil;
import org.hibernate.transform.Transformers;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import repositories.BossRepo;


@RestController
public class BossController {

    @Autowired
    BossRepo bossRepo;

    @RequestMapping(value=  "/api/restrict/parameters" , method = RequestMethod.GET)
    public Iterable<BossAbility> getParameters()
    {
        return bossRepo.findAll();
    }
}