### 操作流程
####(docker环境下)
docker ps -a 
docker start (ps里的代号)
docker exec -it 代号 bash
#### 导航到工作空间下，编译

```bash
cd /workspace
source devel/setup.bash
conda activate ros-python
```
启roscore
#### 运行 UR12e 驱动文件

```bash
roslaunch example_organization_ur_launch ex-ur10-1.launch
```

#### 运行 rviz

```bash
roslaunch ur10e_moveit_config battery_sleeve.launch
```

#### 运行 realsense

```bash
roslaunch realsense2_camera rs_multiple_devices.launch serial_no_camera1:=130322272990 serial_no_camera2:=745412070609
roslaunch realsense2_camera rs_camera.launch align_depth:=true filters:=hole_filling
```

#### 运行手眼标定程序，发布转换关系
```bash
roslaunch easy_handeye publish.launch
```

#### 启动`YOLOv5`服务端

```bash
cd src/fmauch_universal_robot/ur_real_robot/YOLO_v5_detect
python YOLO_server.py
```

#### 启动`np`服务端

```bash
cd src/fmauch_universal_robot/ur_real_robot/ur_control/scripts/true_sleeve_change
python true_np_server.py 

```

#### 启动`VAE`服务端

```bash
cd src/fmauch_universal_robot/ur_real_robot/VAE_detect
python vae_server.py 


```

#### 运行`nsplanner.py` (进行基于神经符号学的拆解规划)

```bash
python /src/Project/UR_control/scripts/test_task.py 

