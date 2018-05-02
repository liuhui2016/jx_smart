package com.game.bmanager.service;

import java.util.List;

import com.game.bmanager.entity.JxVideo;
import com.game.modules.orm.Page;
import com.game.modules.orm.PropertyFilter;
import com.game.modules.service.GenericManager;

public interface IJxVideoService extends GenericManager<JxVideo, Long>{

	Page<JxVideo> searchPages(Page<JxVideo> page, List<PropertyFilter> filters, String sup_id);

}
