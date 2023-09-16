package com.laptrinhjavaweb.service.impl;

import java.awt.image.BufferedImage;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.laptrinhjavaweb.converter.CustomMultipartFile;
import com.laptrinhjavaweb.util.ImageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.laptrinhjavaweb.config.PasswordEncoderConfig;
import com.laptrinhjavaweb.converter.UserConverter;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.util.EmailUtils;
import com.laptrinhjavaweb.util.SecurityUtils;
import com.laptrinhjavaweb.util.TokenUtils;

import javax.imageio.ImageIO;
import javax.xml.bind.DatatypeConverter;

@Service // khai báo để AutoWired cho service
public class UserService implements IUserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private UserConverter userConverter;

	@Autowired
	private PasswordEncoderConfig passwordEncoder;

	@Override
	public UserDTO save(UserDTO userDTO) {

		UserEntity timTaiKhoan = userRepository.findOneByUserNameAndStatus(userDTO.getUserName(), 0);

		String baoLoi = "";

		if (timTaiKhoan != null) {
			userRepository.delete(timTaiKhoan.getId());
			baoLoi = "Đã xóa tài khoản chưa xác thực";
		}

		if (baoLoi.length() == 0 || baoLoi.equals("Đã xóa tài khoản chưa xác thực")) {
			// Set mã xác thực
			String maXacThuc = TokenUtils.getMaXacThuc();

			// Set thời gian hiệu lực của mã xác thực
			Calendar c = Calendar.getInstance();
			c.add(Calendar.MINUTE, 2); // thời gian hiệu lực: 2 phút
			Timestamp thoiGianHieuLucXacThuc = new Timestamp(c.getTimeInMillis());

			userDTO.setValidTime(thoiGianHieuLucXacThuc);
			userDTO.setToken(maXacThuc);
			userDTO.setStatus(0);
			userDTO.setPassword(passwordEncoder.passwordEncoder().encode(userDTO.getPassword()));
			// Set avatar mặc định
			userDTO.setAvatar("https://www.garyqi.com/wp-content/uploads/2017/01/default-avatar-500x500.jpg");

			UserEntity userEntity = userConverter.toEntity(userDTO);

			RoleEntity r1 = new RoleEntity();
			if (userEntity.getUserName().startsWith("admin") || userEntity.getUserName().startsWith("quang")) {
				r1.setId(1L); // set role là Admin
			} else {
				r1.setId(2L); // set role là Nhân Viên
			}
			List<RoleEntity> role = new ArrayList<RoleEntity>();
			role.add(r1);
			userEntity.setRoles(role);

			UserEntity user = userRepository.save(userEntity);

			if (user != null) {
				sendEmailToUser(user, "Xác thực tài khoản để đăng nhập | ");
				return userConverter.toDTO(user);
			}
		}
		return null;

	}

	public void sendEmailToUser(UserEntity user, String content) {
		// Gửi email cho khách hàng
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();

		final String baseUrl = ServletUriComponentsBuilder.fromCurrentContextPath().build().toUriString();

		String link = baseUrl + "/xac-thuc?maKhachHang=" + user.getId() + "&maXacThuc=" + user.getToken();

		System.out.println(link);

		EmailUtils.sendEmail(user.getEmail(), content + dtf.format(now), getEmailContent(user, link));
	}

	public static String getEmailContent(UserEntity kh, String link) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Calendar c = Calendar.getInstance();
		c.add(Calendar.MINUTE, 2); // thời gian hiệu lực: 2 phút
		Date thoiGianHieuLucXacThuc = new Date(c.getTimeInMillis());
		sdf.format(thoiGianHieuLucXacThuc);

		String noiDung = "<table style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "<tbody>\r\n"
				+ "<tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\r\n"
				+ "<td style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\">Xin ch&agrave;o bạn <strong>"
				+ kh.getFullName() + "</strong></td>\r\n" + "</tr>\r\n"
				+ "<tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\r\n"
				+ "<td style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\">\r\n"
				+ "<p>Vui l&ograve;ng x&aacute;c thực t&agrave;i khoản của bạn bằng c&aacute;ch nhập mã xác thực này <strong><h1>"
				+ kh.getToken() + "</h1></strong></p>\r\n"
				+ "<p>hoặc click trực tiếp v&agrave;o n&uacute;t <strong>\"X&aacute;c thực email\"</strong> ở b&ecirc;n dưới:</p>\r\n"
				+ "</td>\r\n" + "</tr>\r\n"
				+ "<tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\r\n"
				+ "<td style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\"><a style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; color: #fff; text-decoration: none; line-height: 2em; font-weight: bold; text-align: center; display: inline-block; border-radius: 5px; text-transform: capitalize; background-color: #f06292; margin: 0; border-color: #f06292; border-style: solid; border-width: 8px 16px;\" href=\""
				+ link + "\">X&aacute;c thực email</a></td>\r\n" + "</tr>\r\n"
				+ "<tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\r\n"
				+ "<td style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0 0 20px;\" valign=\"top\">\r\n"
				+ "<h2>Bạn có 2 phút để xác thực tài khoản này!</h2>" + "<h2>Thời gian hiệu lực tới "
				+ sdf.format(thoiGianHieuLucXacThuc) + "</h2>"
				+ "<p>Đ&acirc;y l&agrave; email tự động vui l&ograve;ng kh&ocirc;ng phản hồi email n&agrave;y.</p>\r\n"
				+ "<p>Tr&acirc;n trọng cảm ơn,</p>\r\n" + "<strong>Twinkle (Chan Quang Dev)</strong>\r\n"
				+ "<p>Support Team</p>\r\n" + "</td>\r\n" + "</tr>\r\n"
				+ "<tr style=\"font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; margin: 0;\">\r\n"
				+ "<td style=\"text-align: center; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; box-sizing: border-box; font-size: 14px; vertical-align: top; margin: 0; padding: 0;\" valign=\"top\">&copy; 2018 Twinkle</td>\r\n"
				+ "</tr>\r\n" + "</tbody>\r\n" + "</table>";
		return noiDung;
	}

	@Override
	public UserDTO findById(Long id) {
		return userConverter.toDTO(userRepository.findOne(id));
	}

	@Override
	public UserDTO update(UserDTO dto) {
		UserEntity entity = userRepository.findOne(dto.getId());
		if (entity.getStatus() == 0)
			entity.setStatus(dto.getStatus());
		return userConverter.toDTO(userRepository.save(entity));
	}

	@Override
	public void delete(Long id) {
		userRepository.delete(id);
	}

	@Override
	public UserDTO findByUserName(String userName) {
		return userConverter.toDTO(userRepository.findOneByUserName(userName));
	}


	@Autowired
	ImageUtils imageUtils;

	@Override
	public UserDTO update1(UserDTO dto) {
		UserEntity oldEntity = userRepository.findOneByUserName(dto.getUserName());


		oldEntity.setFullName(dto.getFullName());
		SecurityUtils.getPrincipal().setFullName(dto.getFullName());

		oldEntity.setEmail(dto.getEmail());
		SecurityUtils.getPrincipal().setEmail(dto.getEmail());


		oldEntity.setAvatar(imageUtils.convertBase64toCloudinaryImage(dto.getAvatar()));
		SecurityUtils.getPrincipal().setAvatar(oldEntity.getAvatar());
		
		oldEntity.setEmailReceived(dto.getEmailReceived());
		
		return userConverter.toDTO(userRepository.save(oldEntity));
	}



	@Override
	public UserDTO updatePassword(UserDTO oldUserDTO) {
		UserEntity entity = userRepository.findOne(oldUserDTO.getId());
		if(entity.getChangePasswordStatus() == null || entity.getChangePasswordStatus() == false) { // thay đổi mật khẩu (Sau khi đăng nhập)
			if (oldUserDTO.getPassword() != null && oldUserDTO.getNewPassword() != null) {
				boolean checkOldPassword = passwordEncoder.passwordEncoder().matches(oldUserDTO.getPassword(), entity.getPassword());
				boolean checkNewPasswordWithOld = passwordEncoder.passwordEncoder().matches(oldUserDTO.getNewPassword(),
						entity.getPassword());
				if (checkOldPassword && !checkNewPasswordWithOld) {
					entity.setPassword(passwordEncoder.passwordEncoder().encode(oldUserDTO.getNewPassword()));
					return userConverter.toDTO(userRepository.save(entity));
				} else {
					return null;
				}
			}
		}  else if (entity.getChangePasswordStatus() == true) { // thay đổi mật khẩu (Quên mật khẩu)
			entity.setPassword(passwordEncoder.passwordEncoder().encode(oldUserDTO.getNewPassword()));
			return userConverter.toDTO(userRepository.save(entity));
		}
		return null;
	}

	@Override
	public UserDTO findOneByEmailAndUserName(String email, String userName) {
		UserEntity entity = userRepository.findOneByEmailAndUserName(email, userName);
		if (entity != null) {
			return userConverter.toDTO(entity);
		} else {
			return null;
		}
	}

	@Override
	public UserDTO update2(UserDTO dto) {
		UserEntity entity = userRepository.findOne(dto.getId());
		entity.setChangePasswordStatus(true);
		return userConverter.toDTO(userRepository.save(entity));
	}

	@Override
	public void validateToChangePassword(UserDTO oldUserDTO) {
		UserEntity entity = new UserEntity();
		if (oldUserDTO.getId() != null) { // thay đổi mật khẩu (Quên mật khẩu)
			entity = userRepository.findOne(oldUserDTO.getId());
			// Set mã xác thực
			String maXacThuc = TokenUtils.getMaXacThuc();

			// Set thời gian hiệu lực của mã xác thực
			Calendar c = Calendar.getInstance();
			c.add(Calendar.MINUTE, 2); // thời gian hiệu lực: 2 phút
			Timestamp thoiGianHieuLucXacThuc = new Timestamp(c.getTimeInMillis());

			entity.setValidTime(thoiGianHieuLucXacThuc);
			entity.setToken(maXacThuc);
			entity.setChangePasswordStatus(false);

//			entity.setNewPassword(passwordEncoder.passwordEncoder().encode(oldUserDTO.getNewPassword()));
			sendEmailToUser(entity, "Xác thực tài khoản để thay đổi mật khẩu | ");
			userRepository.save(entity);
		}
	}

	@Override
	public UserDTO findByIdAndVerificationCode(Long id, String token) {
		UserEntity entity = userRepository.findOneByIdAndToken(id, token);
		if(entity != null) {
			return userConverter.toDTO(entity);
		} else {
			return null;
		}
		
	}

	@Override
	public void deleteTokenAndChangePasswordStatus(UserDTO dto) {
		UserEntity findOne = userRepository.findOne(dto.getId());
		findOne.setToken(null);
		findOne.setChangePasswordStatus(false);
		userRepository.save(findOne);
	}

	@Override
	public List<UserDTO> findByFullName(String userName) {
		List<UserDTO> models = new ArrayList<UserDTO>();
		List<UserEntity> entities = userRepository.findByFullName(userName);
		for (UserEntity item : entities) {
			UserDTO userDTO = userConverter.toDTO(item); // convert từ entity -> dto
			models.add(userDTO);
		}
		return models;
	}

	@Override
	public List<UserDTO> findBy9FriendList(Long id) {
		List<UserDTO> models = new ArrayList<UserDTO>();
		List<UserEntity> entities = userRepository.findBy9ListFriend(id);
		for (UserEntity item : entities) {
			UserDTO userDTO = userConverter.toDTO(item); // convert từ entity -> dto
			models.add(userDTO);
		}
		return models;
	}

	@Override
	public List<UserDTO> findByAllFriendList(Long id) {
		List<UserDTO> models = new ArrayList<UserDTO>();
		List<UserEntity> entities = userRepository.findByListFriend(id);
		for (UserEntity item : entities) {
			UserDTO userDTO = userConverter.toDTO(item); // convert từ entity -> dto
			models.add(userDTO);
		}
		return models;
	}

	

}
