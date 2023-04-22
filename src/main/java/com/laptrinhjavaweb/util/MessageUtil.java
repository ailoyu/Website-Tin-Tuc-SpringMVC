package com.laptrinhjavaweb.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.constant.SystemConstant;

@Component // để autoWired
public class MessageUtil {

	public Map<String, String> getMessage(String message) {

		Map<String, String> result = new HashMap<String, String>();

		if (message.equals("update_success")) {
			result.put("message", SystemConstant.UPDATE_SUCCESS);
			result.put("alert", "success");
		} else if (message.equals("insert_success")) {
			result.put("message", SystemConstant.INSERT_SUCCESS);
			result.put("alert", "success");
		} else if(message.endsWith("delete_success")) {
			result.put("message", SystemConstant.DELETE_SUCCESS);
			result.put("alert", "success");
		} else if (message.equals("error_system")) {
			result.put("message", SystemConstant.ERROR_SYSTEM);
			result.put("alert", "danger");
		}  else if(message.equals("register_success")) {
			result.put("message", SystemConstant.REGISTER_SUCCESS);
			result.put("alert", "success");
		} else if(message.equals("register_fail")) {
			result.put("message", SystemConstant.REGISTER_FAIL);
			result.put("alert", "danger");
		}

		return result;
	}

}
