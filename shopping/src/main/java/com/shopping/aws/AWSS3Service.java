package com.shopping.aws;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Service
public class AWSS3Service {

	@Autowired
	private AmazonS3 s3Client;
	
	@Value("daoningbucket")
	private String bucketName;
	
	public  String uploadObject(MultipartFile multipartFile, String storedFileName) throws IOException {
		String filePath = "/"+storedFileName;
		s3Client.putObject(new PutObjectRequest(bucketName, filePath, multipartFile.getInputStream(),null));
		return s3Client.getUrl(bucketName, filePath).toString();
	}
	//Search s3업로드
	public  String uploadObject(File File, String storedFileName) throws IOException {
		String filePath = "/"+storedFileName;
		s3Client.putObject(bucketName, filePath, File);
		return s3Client.getUrl(bucketName, filePath).toString();
	}
	
}