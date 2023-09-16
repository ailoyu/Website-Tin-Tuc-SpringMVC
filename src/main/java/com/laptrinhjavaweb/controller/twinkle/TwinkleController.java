package com.laptrinhjavaweb.controller.twinkle;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.FriendshipDTO;
import com.laptrinhjavaweb.dto.LikeDTO;
import com.laptrinhjavaweb.dto.PostDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.service.IFriendshipService;
import com.laptrinhjavaweb.service.ILikeService;
import com.laptrinhjavaweb.service.IPostService;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.util.SecurityUtils;

@Controller(value = "homeControllerOfSocialMedia") // controller của thằng spring mvc
public class TwinkleController {
	
	@Autowired 
	private IPostService postService;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IFriendshipService friendshipService;
	
	@Autowired
	private ILikeService likeService;
	
	
	@GetMapping(value = { "/twinkle" })
	public ModelAndView trangChuTwinkle() {
		ModelAndView mav = new ModelAndView("web/twinkle");
		List<PostDTO> listPost = postService.getFriendPostsForNewfeeds(SecurityUtils.getPrincipal().getId());
		if(SecurityUtils.getPrincipal() != null) {
		List<LikeDTO> likedPost = likeService.getLikedPost(SecurityUtils.getPrincipal().getId(), "LIKE");
			for (LikeDTO likeDTO : likedPost) {
				for (PostDTO postDTO : listPost) {
					if(likeDTO.getPostId() == postDTO.getId()) {
						postDTO.setLiked(true);
					}
				}
			}
		}

		mav.addObject("userName", SecurityUtils.getPrincipal().getUsername());

		// chữ cuối cùng trong tên
		String[] name = SecurityUtils.getPrincipal().getFullName().split(" ");
		mav.addObject("name", name[name.length - 1]);

		// Hiện thông tin bài viết
		mav.addObject("listPost", listPost);

		// Hện danh sách bạn bè
		List<UserDTO> listFriend = userService.findByAllFriendList(SecurityUtils.getPrincipal().getId());
		mav.addObject("listFriend", listFriend);

		// Hiện đầy đủ đủ thông tin user
		UserDTO dto = userService.findById(SecurityUtils.getPrincipal().getId());
		mav.addObject("model", dto);
		return mav;
	}
	
	
	@GetMapping(value = {"/trang-ca-nhan/{userId}", "/trang-ca-nhan", "/trang-ca-nhan/{userId}/{listFriend}" })
	public ModelAndView trangCaNhan(@PathVariable(value = "userId", required = false) Long userId,
									@PathVariable(value = "listFriend", required = false) String danhSachBanBe) {
		ModelAndView mav = new ModelAndView("web/user/personalPage");
		UserDTO dto = new UserDTO();
		Long requesterId;
		if(userId == null){
			requesterId = SecurityUtils.getPrincipal().getId();
			dto = userService.findById(SecurityUtils.getPrincipal().getId());
		}else{
			requesterId = userId;
			dto = userService.findById(userId);
		}
		if(SecurityUtils.getPrincipal() != null) {
			if(Long.compare(requesterId, SecurityUtils.getPrincipal().getId()) != 0) {
				FriendshipDTO friend = new FriendshipDTO();
				friend = friendshipService.findByRequesterIdAndAddresseeId(SecurityUtils.getPrincipal().getId(), userId);
				if(friend == null) {
					friend = friendshipService.findByRequesterIdAndAddresseeId(userId, SecurityUtils.getPrincipal().getId());
					mav.addObject("friend1", friend);
				} else {
					mav.addObject("friend", friend);
				}
				
			}
		}
		List<UserDTO> listFriend = userService.findBy9FriendList(requesterId);
		mav.addObject("listFriend", listFriend);
		if(danhSachBanBe != null) {
			List<UserDTO> allListFriend = userService.findByAllFriendList(requesterId);
			mav.addObject("listFriend1", allListFriend);
		}
		List<PostDTO> listPost = postService.getAllPostsByUserId(requesterId);
		if(SecurityUtils.getPrincipal() != null) {
		List<LikeDTO> likedPost = likeService.getLikedPost(SecurityUtils.getPrincipal().getId(), "LIKE");
			for (LikeDTO likeDTO : likedPost) {
				for (PostDTO postDTO : listPost) {
					if(likeDTO.getPostId() == postDTO.getId()) {
						postDTO.setLiked(true);
					}
				}
			}
		}
		mav.addObject("listPost", listPost);

		// Hiện đầy đủ thông tin user
		mav.addObject("model", dto);


		// chữ cuối cùng trong tên
		String[] name = dto.getFullName().split(" ");
		mav.addObject("name", name[name.length - 1]);
		
		
		mav.addObject("userName", dto.getUserName());
		
		return mav;
	}
	
	@GetMapping(value = {"/load/{userId}"})
	public List<PostDTO> loadMore(@PathVariable(value = "userId", required = false) Long userId) {
		
		List<PostDTO> listPost = postService.getAllPostsByUserId(userId);
		
		return listPost;
	}
	
	@GetMapping(value = {"/tin-nhan"})
	public ModelAndView tinNhan() {
		ModelAndView mav = new ModelAndView("web/user/messenger");
		
		List<UserDTO> listFriend = userService.findByAllFriendList(SecurityUtils.getPrincipal().getId());
		mav.addObject("listFriend", listFriend);
		
		// gửi tin nhắn
//		AbstractApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
//		
//		MessengerSender messengerSender = context.getBean(MessengerSender.class);
//		
//		messengerSender.sendMessage("Hola Quang");
//		System.out.println("Gửi tin nhắn thành công");
//		
//		((AbstractApplicationContext) context).close();
		
		return mav;
	}
}
