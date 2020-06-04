package com.ljh.controller.user;

import com.ljh.model.Garbage;
import com.ljh.service.GarbageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/distinguish")
public class DistinguishController {
	
	@Autowired
	private GarbageService garbageService;
	
	// 跳转到垃圾识别的界面
	@RequestMapping("toDistinguish")
	public String toDistinguish() {
		return "user/distinguish";
	}
	/**
	 * 根据关键字判断垃圾类别
	 * 
	 * @param kw 输入的垃圾名称
	 * @return
	 */
	@RequestMapping("/search")
	@ResponseBody
	public Garbage search(String kw) {
		System.out.println("kw=" + kw);
		//String resultData = HttpUtil.sendGet(kw);
		Garbage garbage = garbageService.selectByName(kw);
		String test = garbage.getCategory();
		System.out.println(test);
		//String resultData = "{\"data\":[{\"name\":\"aa\",\"age\":\"12\"},{\"name\":\"bb\",\"age\":\"13\"}]}";
		//System.err.println(resultData);

		// 将json数据封装为bean
		//String info = JSON.parseObject(resultData).getJSONArray("data").getString(0);
		//System.err.println(info);
		//Garbage garbageInfo = JSON.parseObject(info, Garbage.class);
		//System.out.println(garbageInfo.toString());
		
		// 获取投放建议
		//GarbageType garbageType = garbageTypeService.ByGarbageTypeName(garbage.getCategory());
		//if(garbageType != null) {
		//	garbage.setRemark(garbageType.getGarbagetip());
		//}
		

		return garbage;
	}
	
}
