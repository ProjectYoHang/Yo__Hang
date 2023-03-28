package com.example.model;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.mapper.RvMapperinter;

@Repository
public class RvBoardDAO {

	//private String uploadPath = "C:/Users/USER/git/Yo__Hang/YoHang/src/main/webapp/upload/reviews";
	private String uploadPath = "/wjddnr0709/tomcat/webapps/ROOT/upload/reviews";
	@Autowired
	private RvMapperinter mapper;

	public void rvWrite() {}

	public int rvWriteOk( RvBoardTO to ) {

		int flag = 1;

		
		
		/////
		
		
		BookTO bto = new BookTO();
		bto.setM_id(to.getRv_id());
		System.out.println(bto.getM_id());
		bto = mapper.bookInfo(bto);
		
		
		/////
		to.setRv_book_num( Integer.parseInt(bto.getBook_num()));
		to.setRv_room_seq( Integer.parseInt(bto.getRoom_seq()));
		
		int result = mapper.rvWriteOk(to);
		
		if(result == 1 ) {
			flag = 0;
		}

		return flag;
	}

	public Map<String, Object> rvList(RvBoardListTO listTo) {

		listTo.setTotalRecord(mapper.rvAllCount());
		int totalRecord = listTo.getTotalRecord();
		
		// 현재 페이지
		int cpage = listTo.getCpage();
		
		// 한 페이지에 보여줄 데이터 갯수 = 5
		int recordPerPage = listTo.getRecordPerPage();
		
		listTo.setStartPageNum(1);
		int startPageNum = listTo.getStartPageNum();
		
		listTo.setLastPageNum(recordPerPage);
		int lastPageNum = listTo.getLastPageNum();
		
		
		int startRow = (cpage - 1) * recordPerPage;
		
		listTo.setStartRow(startRow);
		listTo.setRecordPerPage(recordPerPage);
		
		ArrayList<RvBoardTO> rvLists = mapper.rvList(listTo);
		
		int lastPage = (int)(Math.ceil(totalRecord / recordPerPage)) + 1;

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("rvLists", rvLists);
		resultMap.put("cpage", cpage);
		resultMap.put("lastPage", lastPage);
		resultMap.put("startPageNum", startPageNum);
		resultMap.put("lastPageNum", lastPageNum);
		resultMap.put("totalRecord", totalRecord);
		resultMap.put("recordPerPage", recordPerPage);
		
		return resultMap;
	}

	public RvBoardTO rvView(RvBoardTO to) {

		to = mapper.rvView(to);

		return to;
	}
	
	public RvBoardTO rvDelete(RvBoardTO to) {
		
		to = mapper.rvDelete(to);
		
		return to;
	}

	public int rvDeleteOk(RvBoardTO to) {
		
		String oldFilename = mapper.rvImgName(to);
		
		System.out.println(oldFilename);
		
		int flag = 2;
		
		int result = mapper.rvDeleteOk(to);
		
		if(result == 0) {
			flag = 1;
		} else if(result == 1) {
			flag = 0;
			
			try {
				Path file = Paths.get(uploadPath + "/" + oldFilename);
				
				Files.deleteIfExists(file);
			} catch(Exception e) {
				System.out.println("[에러] : " + e.getMessage());
			}
			
		}
		
		return flag;

	}
	
	public RvBoardTO rvModify(RvBoardTO to) {
		
		to = mapper.rvModify(to);
		
		return to;
	}
	
	public int rvModifyOk(RvBoardTO to) {
		
		
		
		String oldFilename = mapper.rvImgName(to);
		
		int flag = 2;
		
		// 기존 파일이 있는 경우
		if(oldFilename != null) {
			
			// 기존 파일이 있으면서 파일 변경이 있는 경우
			if(to.getRv_img_name() != null) {
				
				int result = mapper.rvModifyOk1(to);
				
				if(result == 1) {
					flag = 0;
					
					File file = new File(uploadPath, oldFilename);
					file.delete();
					
				} else {
					flag = 1;
					
					File file = new File(uploadPath, to.getRv_img_name());
					file.delete();
					
				}
				
			// 기존 파일 있으면서 파일변경 X
			} else {
				int result = mapper.rvModifyOk2(to);
				
				if(result == 1) {
					flag = 0;
				} else {
					flag = 1;
				}
				
			}
		
		// 기존 파일이 없는 경우
		} else {
			
			// 파일을 새로 업로드하는 경우
			if(to.getRv_img_name() != null) {
				
				int result = mapper.rvModifyOk3(to);
				
				if(result == 1) {
					flag = 0;
				} else {
					flag = 1;
					
					File file = new File(uploadPath, to.getRv_img_name());
					file.delete();
				}
				
			} else {
				
				int result = mapper.rvModifyOk4(to);
				
				if(result == 1) {
					flag = 0;
				} else {
					flag = 1;
				}	
			}
		}
		
		return flag;
	}
	public room_typeTO Search(room_typeTO to) {
		
	to = mapper.roomtype1(to);	
	
	return to;	
	
	}
	// 회원 리뷰목록
	public ArrayList<RvBoardTO> rvInfos(RvBoardTO to) {
		String id = to.getRv_id();
		
		to.setRv_id(id);
		
		ArrayList<RvBoardTO> rvInfos = mapper.rvInfos(to);
		
		return rvInfos;
	}
	// 마이페이지에 보여줄 최근 리뷰 3개 데이터
	public ArrayList<RvBoardTO> rvInfo(RvBoardTO to) {
		String id = to.getRv_id();
		
		to.setRv_id(id);
		
		ArrayList<RvBoardTO> rvInfo = mapper.rvInfo(to);
		
		return rvInfo;
	}	
	public int reviewDelete(RvBoardTO to) {
		
		String oldFilename = mapper.rvImgName(to);
		
		int flag = 1;
		
		int result = mapper.reviewDeleteOk(to);
		if(result == 1) {
			flag = 0;
			
			if(oldFilename != "") {
				File file = new File(uploadPath, oldFilename);
				file.delete();
			}
		}
		
		return flag;
	}
}