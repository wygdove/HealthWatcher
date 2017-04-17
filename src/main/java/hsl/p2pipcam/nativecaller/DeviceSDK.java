package hsl.p2pipcam.nativecaller;

public class DeviceSDK {
	/**
	 * 初始化app
	 * 
	 * @param serv
	 * @return
	 */
	public static int initialize(String serv) {
		return NativeCaller.InitLib(serv);
	}

	/**
	 * 搜索前初始化
	 * 
	 * @return
	 */
	public static int initSearchDevice() {
		return NativeCaller.SearchDeviceInit();
	}

	/**
	 * 设置搜索回调对象
	 * 
	 * @param object
	 */
	public static void setSearchCallback(Object object) {
		NativeCaller.SetSearchCallBack(object);
	}

	/**
	 * 设置回调对象
	 * 
	 * @param object
	 */
	public static void setCallback(Object object) {
		NativeCaller.SetCallBack(object);
	}

	/**
	 * 退出搜索
	 * 
	 * @return
	 */
	public static int unInitSearchDevice() {
		return NativeCaller.SearchDeviceUninit();
	}

	/**
	 * 搜索设备
	 * 
	 * @return
	 */
	public static int searchDevice() {
		return NativeCaller.SearchDevice();
	}

	/**
	 * 创建设备
	 * 
	 * @param strUsername
	 * @param strPwd
	 * @param strHost
	 * @param nPort
	 * @param StrDid
	 * @param NetType
	 *            0=TCP ,1=P2P
	 * @return userid
	 */
	public static long createDevice(String strUsername,String strPwd,String strHost,int nPort,String StrDid,int NetType) {
		return NativeCaller.CreateInstance(strUsername,strPwd,strHost,nPort,StrDid,NetType);
	}

	/**
	 * 销毁设备
	 * 
	 * @param UserID
	 * @return
	 */
	public static int destoryDevice(long UserID) {
		return NativeCaller.DestroyInstance(UserID);
	}

	/**
	 * 设备开启
	 * 
	 * @param userID
	 * @return
	 */
	public static int openDevice(long userID) {
		return NativeCaller.Start(userID);
	}

	/**
	 * 设备关闭
	 * 
	 * @param userID
	 * @return
	 */
	public static int closeDevice(long userID) {
		return NativeCaller.Stop(userID);
	}

	/**
	 * 获取设备参数
	 * 
	 * @param userID
	 * @param nType
	 * @return
	 */
	public static int getDeviceParam(long userID,int nType) {
		return NativeCaller.GetParam(userID,nType);
	}

	/**
	 * 设置设备参数
	 * 
	 * @param userID
	 * @param nType
	 * @param param
	 * @return
	 */
	public static int setDeviceParam(long userID,int nType,String param) {
		return NativeCaller.SetParam(userID,nType,param);
	}

	/**
	 * 播放实时视频流
	 * 
	 * @param userID
	 * @param streamId
	 * @param subStreamId
	 * @return
	 */
	public static int startPlayStream(long userID,int streamId,int subStreamId) {
		return NativeCaller.StartStream(userID,streamId,subStreamId);
	}

	/**
	 * 获取RGB数据
	 * 
	 * @param UserID
	 * @param StreamId
	 * @param subStreamId
	 * @param videofmt
	 * @return
	 */
	public static int startPlayStreamRgb(long UserID,int StreamId,int subStreamId,int videofmt) {
		return NativeCaller.StartStream2(UserID,StreamId,subStreamId,videofmt);
	}

	/**
	 * 结束播放视频流
	 * 
	 * @param userID
	 * @return
	 */
	public static int stopPlayStream(long userID) {
		return NativeCaller.StopStream(userID);
	}

	/**
	 * 设置画板
	 * 
	 * @param userID
	 * @param render
	 */
	public static void setRender(long userID,Object render) {
		NativeCaller.SetRender(userID,render);
	}

	/**
	 * 控制设备
	 * 
	 * @param UserID
	 * @param nType
	 * @return
	 */
	public static int ptzControl(long UserID,int nType) {
		return NativeCaller.PtzControl(UserID,nType);
	}

	/**
	 * 播放音频
	 * 
	 * @param UserID
	 * @param AudioId
	 * @return
	 */
	public static int startPlayAudio(long UserID,int AudioId) {
		return NativeCaller.StartAudio(UserID,AudioId);
	}

	/**
	 * 结束音频播放
	 * 
	 * @param UserID
	 * @return
	 */
	public static int stopPlayAudio(long UserID) {
		return NativeCaller.StopAudio(UserID);
	}

	/**
	 * 开始说话
	 * 
	 * @param nUserID
	 * @return
	 */
	public static int startTalk(long UserID) {
		return NativeCaller.StartTalk(UserID);
	}

	/**
	 * 结束说话
	 * 
	 * @param UserID
	 * @return
	 */
	public static int stopTalk(long UserID) {
		return NativeCaller.StopTalk(UserID);
	}

	/**
	 * 发送说话数据
	 * 
	 * @param nUserID
	 * @param data
	 * @param size
	 * @return
	 */
	public static int SendTalkData(long userID,byte[] data,int size) {
		return NativeCaller.SendTalkData(userID,data,size);
	}

	/**
	 * 图片流转换
	 * 
	 * @param yuv
	 * @param rgb
	 * @param width
	 * @param height
	 * @return
	 */
	public static int YUV420ToRGB565(byte[] yuv,byte[] rgb,int width,int height) {
		return NativeCaller.YUV420ToRGB565(yuv,rgb,width,height);
	}

	/**
	 * 获取远程录像
	 * 
	 * @param userid
	 * @return
	 */
	public static int getRecordVideo(long userid,int bYear,int bMon,int bDay,int eYear,int eMon,int eDay) {
		return NativeCaller.SearchRecordFile(userid,bYear,bMon,bDay,0,0,0,eYear,eMon,eDay,23,59,59);
	}

	/**
	 * 设置录像播放Render
	 * 
	 * @param nUserID
	 * @param render
	 * @return
	 */
	public static int setRecordRender(long nUserID,Object render) {
		return NativeCaller.SetRecordRender(nUserID,render);
	}

	/**
	 * 开始播放录像
	 * 
	 * @param nUserID
	 * @param filename
	 * @return
	 */
	public static int startPlayRecord(long nUserID,String filename,int pos) {
		return NativeCaller.StartPlayRecord(nUserID,filename,pos);
	}

	/**
	 * 结束播放录像
	 * 
	 * @param nUserID
	 * @param filename
	 * @return
	 */
	public static int stopPlayRecord(long nUserID,String filename) {
		return NativeCaller.StopPlayRecord(nUserID,filename);
	}

	/**
	 * 调整播放位置
	 * 
	 * @param nUserID
	 * @param filename
	 * @param pos
	 * @return
	 */
	public static int playRecordPos(long nUserID,String filename,int pos) {
		return NativeCaller.PlayRecordPos(nUserID,filename,pos);
	}

	/**
	 * 暂停播放
	 * 
	 * @param nUserID
	 * @param filename
	 * @return
	 */
	public static int pausePlayRecord(long nUserID,String filename) {
		return NativeCaller.PausePlayRecord(nUserID,filename);
	}

	/**
	 * 检测网络
	 */
	public static void networkDetect() {
		NativeCaller.NetworkDetect();
	}

	/**
	 * 结束app
	 * 
	 * @return
	 */
	public static int unInitialize() {
		return NativeCaller.UnInitLib();
	}

}
