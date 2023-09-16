package com.laptrinhjavaweb.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.constant.SystemConstant;

@Component // để autoWired
public class MessageUtils {

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
		} else if(message.equals("incorrect_password")) {
			result.put("message", SystemConstant.INCORRECT_PASSWORD);
			result.put("alert", "danger");
		} else if(message.equals("invalid_account")) {
			result.put("message", SystemConstant.INVALID_ACCOUNT);
			result.put("alert", "danger");
		} else if(message.equals("confirm_password")) {
			result.put("message", SystemConstant.CONFIRM_PASSWORD);
			result.put("alert", "danger");
		} else if(message.equals("update_account_success")) {
			result.put("message", SystemConstant.UPDATE_ACCOUNT_SUCCESS);
			result.put("alert", "success");
		} else if(message.equals("update_account_fail")) {
			result.put("message", SystemConstant.UPDATE_ACCOUNT_FAIL);
			result.put("alert", "danger");
		} else if(message.equals("inavailable_account")) {
			result.put("message", SystemConstant.INAVAILABLE_ACCOUNT);
			result.put("alert", "danger");
		} else if(message.equals("same_password")) {
			result.put("message", SystemConstant.SAME_PASSWORD);
			result.put("alert", "danger");
		} else if(message.equals("change_password_success")) {
			result.put("message", SystemConstant.CHANGE_PASSWORD_SUCCESS);
			result.put("alert", "success");
		} else if(message.equals("change_password_fail")) {
			result.put("message", SystemConstant.CHANGE_PASSWORD_FAIL);
			result.put("alert", "danger");
		} else if(message.equals("blank_password")) {
			result.put("message", SystemConstant.BLANK_PASSWORD);
			result.put("alert", "danger");
		} else if(message.equals("invalid_username_email")) {
			result.put("message", SystemConstant.INVALID_USERNAME_EMAIL);
			result.put("alert", "danger");
		}
		return result;
	}

}
