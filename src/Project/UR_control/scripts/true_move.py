#!/usr/bin/env python
# -*- coding: UTF-8 -*-
from true_base import TrueBase
import math
import geometry_msgs.msg
import tf
import rospy


class TrueMove(TrueBase):
    def __init__(self, group_):
        super(TrueMove, self).__init__(group_)
        self.request_params = ['coarse_pose']

    def action(self, all_info, pre_result_dict, kalman,yolo,plc,sleeve_type):
        for param in self.request_params:
            if not param in pre_result_dict.keys():
                print(param, 'must give')
                return False
        print("param satified, start to do move")
        # planner = all_info['planner_handler']
        # latest_infos = planner.get_latest_infos()
        target = pre_result_dict["coarse_pose"]
        orgin_pose = self.group.get_current_pose(self.effector).pose
        print('orgin_pose:', orgin_pose)
        print('target!!!!!:', target)
        
        if not self.set_arm_pose(self.group, target, self.effector):
            return {'success': False}
        # rospy.sleep(30)
        return {'success': True}