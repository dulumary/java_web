package com.hagulu.marondalgram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class FileManagerService {
	
	public final static String FILE_UPLOAD_PATH = "C:\\Users\\김인규\\Documents\\lecture\\webProjectSNS\\images/";
		
	public static String saveImageFile(int userId, MultipartFile file) throws IOException {
		
		String directoryName = "/images/" + userId + "_" + System.currentTimeMillis() + "/";
		String uploadFilePath = FILE_UPLOAD_PATH + directoryName;
		
		File direcotry = new File(uploadFilePath);
		if(!direcotry.mkdir()) {
			
			return null;  // 디렉토리 생성에 문제 생기면 에러 처리 필요 
		}

		byte[] bytes = file.getBytes();
	    Path path = Paths.get(uploadFilePath + file.getOriginalFilename());
	    Files.write(path, bytes);
            
		return directoryName + file.getOriginalFilename();
	}
	
	
	
	public static void removeFile(String filePath) throws IOException {
		
		String targetPathString = FILE_UPLOAD_PATH + filePath;
		Path path = Paths.get(targetPathString);
		if(Files.exists(path)) {
			Files.delete(path);
		}
		
		path = Paths.get(targetPathString).getParent();
		
		if(Files.exists(path)) {
			Files.delete(path);
		}
		

	}
}
