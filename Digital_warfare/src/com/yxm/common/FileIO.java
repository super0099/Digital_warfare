package com.yxm.common;
import com.yxm.po.SysUserPo;
import com.yxm.service.ILoginService;
import com.yxm.service.impl.LoginServiceImpl;
import com.yxm.util.ProjectParameter;
import com.yxm.util.Tools;
import com.yxm.vo.JsonMsg;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class FileIO extends WarfareServlet{
    private static final String UPLOAD_PATH = "G:/javaProjectUp/warfare/user";
    private static final  int MEMORY_THRESHOLD = 1024*1024*10;//10MB内存临界值-
    private static final  int MAX_FILE_SIZE = 1024*1024*30;//30mb文件大小
    private static final  int MAX_REQUEST_SIZE = 1024*1024*40;//40mb最大请求大小
    private final ILoginService loginService = new LoginServiceImpl();
    public void getPortraitImage(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        //获取参数
        String imgName = request.getParameter("imgName");
        if (Tools.isNotNull(imgName)){
            //图片名不为空
            String imgPath = UPLOAD_PATH+imgName;
            File fileImg = new File(imgPath);
            if (fileImg.exists()){
                //指定返回的类型
                response.setContentType(Tools.getImageContentType(imgName));
                InputStream in = null;
                OutputStream out = null;
                try {
                    in = new FileInputStream(fileImg);
                    out = response.getOutputStream();
                    //复制
//                    byte[] buff = new byte[1024*1024*10];
//                    int count = 0;
//                    while ((count=in.read(buff,0,buff.length))!=-1){
//                        out.write(buff,0,count);
//                    }
//                    out.flush();
                    //commons-io
                    IOUtils.copy(in,out);
                    out.flush();
                }finally {
                    if (in!=null){
                        in.close();
                    }
                    if (out!=null){
                        out.close();
                    }
                }
            }
        }
    }
    public void modification(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session =request.getSession();
        SysUserPo sysUserPo = (SysUserPo) session.getAttribute(ProjectParameter.SESSION_USER);
        JsonMsg jsonMsg = new JsonMsg();
        //判断是否为表单文件上传如果不是就返回
        if(!ServletFileUpload.isMultipartContent(request)){
            jsonMsg.setMsg("Error: 表单必须包含 enctype=multipart/form-data");
            retunJson(response,jsonMsg);
        }
        //配置上传相关的参数
        DiskFileItemFactory factory = new DiskFileItemFactory();
        //设置内存缓存区,超过后写入临时文件
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        //设置上传到服务器上文件的临时存放目录,也就是说超过最大的值MEMORY_THRESHOLD就存放在这个目录中 -- 非常重要，防止存放到系统盘造成系统盘空间不足
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
        ServletFileUpload upload = new ServletFileUpload(factory);
        //设置编码格式,防止中文乱码
        upload.setHeaderEncoding("utf-8");
        //设置文件的最大值
        upload.setFileSizeMax(MAX_FILE_SIZE);
        //设置请求的最大值
        upload.setSizeMax(MAX_REQUEST_SIZE);
        //判断文件存放目录是否存在,如果不存在就创建一个
        File uploadDir = new File(UPLOAD_PATH);
        if(!uploadDir.exists()){
            //创建文件目录
            uploadDir.mkdirs();
        }
        //拼接文件名称,SimpleDateFormat设置日期格式
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmssSSS_");
        SysUserPo sysUser = new SysUserPo();
        //解析请求内容,提取文件和普通的字段参数
        try {
            List<FileItem> fileItems = upload.parseRequest(request);
            if(fileItems != null && fileItems.size() > 0){
                for(FileItem fileItem:fileItems){
                    //获取字段名称
                    String fieldName = fileItem.getFieldName();
                    //判断是文件还是普通的字段,不是表单元素就是文件
                    if(!fileItem.isFormField()){
                        //文件
                        if("portrait".equals(fieldName)){//再判断是不是头像文件
                            //拼接文件名
                            String fileName = dateFormat.format(new Date())+System.nanoTime()+ Tools.getFileExt(fileItem.getName());
                            //存放路径
                            String filePath = UPLOAD_PATH+fileName;
                            File saveFile = new File(filePath);
                            System.out.println(saveFile);
                            //保存文件到硬盘
                            fileItem.write(saveFile);
                            //把文件保存到对象
                            sysUser.setUserPortrait(fileName);
                        }
                    }else {
                        //元素
                        //需要通过流的方式读取
                        //因为表单文件上传是通过流的方式上传,把字节流转成字符流,fileItem.getInputStream()字节流,指定编码格式
                        BufferedReader br = new BufferedReader(new InputStreamReader(fileItem.getInputStream(), StandardCharsets.UTF_8));
                        String value = br.readLine();//读取到值
                        if(fieldName==null)continue;
                        switch (fieldName){
                            case "nickname": //用户名
                                sysUser.setNickName(value);
                                break;
                        }
                    }
                }
                boolean isUploadImg = sysUser.getUserPortrait()!=null;
                boolean isUploadName = sysUser.getNickName()!=null;
                sysUser.setId(sysUserPo.getId());
                if(isUploadImg==true&&isUploadName==true){
                    boolean isOk = this.loginService.perfectUser(sysUser);
                    if(isOk){
                        session.removeAttribute(ProjectParameter.SESSION_USER);
                        SysUserPo dbUserPo = this.loginService.selectUser(sysUserPo.getUserName());
                        session.setAttribute(ProjectParameter.SESSION_USER,dbUserPo);
                        jsonMsg.setState(true);
                    }else {
                        jsonMsg.setMsg("完善失败");
                    }
                }else {
                    jsonMsg.setMsg("参数异常");
                }
            }else {
                jsonMsg.setMsg("参数异常");
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        retunJson(response,jsonMsg);
    }
}
